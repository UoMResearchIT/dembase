
context("data.frame-methods")

test_that("dtabs gives same answer as xtabs", {
    d <- data.frame(y = 1:20,
                    f1 = rep(1:10, times = 2),
                    f2 = rep(c("a", "b"), each = 10))
    formula <- y ~ f1 + f2
    ans.obtained <- dtabs(d, formula)
    ans.expected <- as(xtabs(formula, d), "array")
    expect_identical(ans.obtained, ans.expected)
    formula <-  ~ f1 + f2
    ans.obtained <- dtabs(d, formula)
    ans.expected <- as(xtabs(formula, d), "array")
    expect_identical(ans.obtained, ans.expected)
    formula <-  ~ f1
    ans.obtained <- dtabs(d, formula)
    ans.expected <- as(xtabs(formula, d), "array")
    expect_identical(ans.obtained, ans.expected)
    formula <- y ~ .
    ans.obtained <- dtabs(d, formula)
    ans.expected <- as(xtabs(formula, d), "array")
    expect_identical(ans.obtained, ans.expected)
    formula <-  ~ .
    ans.obtained <- dtabs(d, formula)
    ans.expected <- as(xtabs(formula, d), "array")
    expect_identical(ans.obtained, ans.expected)
})


test_that("fill answer for dtabs works correctly", {
    d <- data.frame(y = 1:20,
                    f1 = rep(1:10, times = 2),
                    f2 = rep(c("a", "b"), each = 10))
    formula <- y ~ f1 + f2
    d.miss <- d[-20,]
    ans.obtained <- dtabs(d.miss, formula)
    ans.expected <- dtabs(d, formula)
    ans.expected[20] <- 0L
    expect_identical(ans.obtained, ans.expected)
    formula <- y ~ f1 + f2
    d.miss <- d[-20,]
    ans.obtained <- dtabs(d.miss, formula, fill = NA)
    ans.expected <- dtabs(d, formula)
    ans.expected[20] <- NA
    expect_identical(ans.obtained, ans.expected)
    formula <- y ~ f1
    d.miss <- d[-20,]
    ans.obtained <- dtabs(d.miss, formula, fill = NA)
    ans.expected <- dtabs(d, formula)
    ans.expected[10] <- 10L
    expect_identical(ans.obtained, ans.expected)
    formula <- y ~ f1
    d.miss <- d
    d.miss$f1 <- factor(d.miss$f1)
    d.miss <- d.miss[-c(10, 20),]
    ans.obtained <- dtabs(d.miss, formula, fill = 0L)
    ans.expected <- dtabs(d, formula)
    ans.expected[10] <- 0L
    expect_identical(ans.obtained, ans.expected)
    d.miss <- d
    d.miss$f1 <- factor(d.miss$f1)
    d.miss <- d.miss[-c(10, 20),]
    ans.obtained <- dtabs(d.miss, formula, fill = NA)
    ans.expected <- dtabs(d, formula)
    ans.expected[10] <- NA
    expect_identical(ans.obtained, ans.expected)
})
