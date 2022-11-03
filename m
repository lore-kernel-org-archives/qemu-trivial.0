Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oqYix-0006sJ-Nj
	for mharc-qemu-trivial@gnu.org; Thu, 03 Nov 2022 07:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqYic-0006mR-Bf
 for qemu-trivial@nongnu.org; Thu, 03 Nov 2022 07:49:21 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqYiZ-0000Cz-Pk
 for qemu-trivial@nongnu.org; Thu, 03 Nov 2022 07:49:09 -0400
Received: by mail-pf1-x435.google.com with SMTP id m6so1393272pfb.0
 for <qemu-trivial@nongnu.org>; Thu, 03 Nov 2022 04:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JaaT6AL6V4GSHM3aZ04xCdYXCqKPVK5C7p0zfX1D8jA=;
 b=HypRgTJYVOfkTEmo++FQRvYPY7/Y+kRwYQJIsfUBdKFnTq07ODBVlKy/jBDdlh8Bw1
 Agknywkz9440iqbg2MfsAWrbGP0uapwg0WJl1wiUH+ek8KlN86MXYkK/cu6kA60+sMFj
 ByZhMsbFCWb6hFwX3TBEA4H3IZpzlKYlg8DnvV16JOXWX/YrLQBpvnJSIV4LTxSq5Nok
 Ns/qQDexlXNevTJQsmSf0dgmNH4orwBbgFvv+RIYJ4rYcbNMvOcr1Ollk3Z+faa3SNvw
 4NfT4RKdgL6cIPQ0MiQU4y+R69INrpCzbids6txOTMXGBNFhNFNstJqHRRKBRw9O2nyn
 CmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JaaT6AL6V4GSHM3aZ04xCdYXCqKPVK5C7p0zfX1D8jA=;
 b=M0q4dTDQYsYCYWQWPXAj39EW/hAZ2poV0h4ZXwzikwCU3zd7TamxWZ5Qz6t/z85Hxg
 PFQvzjFKLjK6dyxgvAg89y6cN/fydF7Sd5On7Kw6dYVfyH1Ogj+vhQgiSSqaN8CMZ7AE
 HbTIx7603q6MRSx4ksWxECzQd8zxjfhrnbS717RFli2gg9+ddaNrcS+jXYGXz/zUAScS
 8BlTw1nnxkYlfDpopQ+qFINiinMsn+/z4EaCOeWo32adjL2uCNdqW+LCu02KbbQRMpho
 FChnFmVWswmpIvex3RqejwUlnYTOfguOnnnCiZOa6qTFpgpCQewm4xXhlanpYYRViBVB
 y6bA==
X-Gm-Message-State: ACrzQf0ll4hyNp5ZyKnWXPzrZN9CqWtkuZyt/q8LqZGhwKbB0VudArSI
 AQFUxUb8uPOmlh+dCg30ydGIBjWuZXVq9EYrCpSHhvF5Cd8=
X-Google-Smtp-Source: AMsMyM4kWIk/lbJYayUZH0dYcHtkmELEclLVbUXPSUQK6dv61g3esCG3n9Iwa7YilWJnbe+3jNu8Kzgc3g9H/73EgZk=
X-Received: by 2002:a63:84c6:0:b0:46f:f8b0:ba09 with SMTP id
 k189-20020a6384c6000000b0046ff8b0ba09mr10186227pgd.192.1667476145363; Thu, 03
 Nov 2022 04:49:05 -0700 (PDT)
MIME-Version: 1.0
References: <20221102202258.456359-1-sw@weilnetz.de>
In-Reply-To: <20221102202258.456359-1-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Nov 2022 11:48:53 +0000
Message-ID: <CAFEAcA_qLBPvn02wGcAuyQQObgF0PVb=V3OtnG+C51N69xhCjQ@mail.gmail.com>
Subject: Re: [PATCH for 7.2] Fix broken configure with -Wunused-parameter
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Nov 2022 11:49:21 -0000

On Wed, 2 Nov 2022 at 20:24, Stefan Weil via <qemu-devel@nongnu.org> wrote:
>
> The configure script fails because it tries to compile small C programs
> with a main function which is declared with arguments argc and argv
> although those arguments are unused.
>
> Running `configure -extra-cflags=-Wunused-parameter` triggers the problem.
> configure for a native build does abort but shows the error in config.log.
> A cross build configure for Windows with Debian stable aborts with an
> error.
>
> Avoiding unused arguments fixes this.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> See https://gitlab.com/qemu-project/qemu/-/issues/1295.
>
> I noticed the problem because I often compile with -Wextra.
>
> Stefan
>
>  configure | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/configure b/configure
> index 4275f5419f..1106c04fea 100755
> --- a/configure
> +++ b/configure
> @@ -1258,6 +1258,7 @@ if test "$stack_protector" != "no"; then
>    cat > $TMPC << EOF
>  int main(int argc, char *argv[])
>  {
> +    (void)argc;

I'm not a huge fan of this syntax, and it doesn't match the way
we deal with "argument is unused" elsewhere in the codebase
(where we either don't care about it or else use the GCC 'unused'
attribute hidden behind the glib G_GNUC_UNUSED macro).

I am surprised that this didn't get caught by the check in
do_compiler_werror(), which is supposed to report "this
configure test passed without -Werror but failed with
-Werror, so configure is probably buggy.". That's what's
supposed to catch "your compiler warns on stuff our doesn't
in the test case programs".

If you're building with --disable-werror then configure
should be OK anyway. This is probably a good idea if you want
to build with extra warning arguments in --extra-cflags.
If it doesn't work right even with --disable-werror that's
also something we should investigate.

>      char arr[64], *p = arr, *c = argv[0];
>      while (*c) {
>          *p++ = *c++;
> @@ -1607,7 +1608,7 @@ fi
>
>  if test "$safe_stack" = "yes"; then
>  cat > $TMPC << EOF
> -int main(int argc, char *argv[])
> +int main(void)
>  {
>  #if ! __has_feature(safe_stack)
>  #error SafeStack Disabled
> @@ -1629,7 +1630,7 @@ EOF
>    fi
>  else
>  cat > $TMPC << EOF
> -int main(int argc, char *argv[])
> +int main(void)
>  {
>  #if defined(__has_feature)
>  #if __has_feature(safe_stack)
> @@ -1675,7 +1676,7 @@ static const int Z = 1;
>  #define TAUT(X) ((X) == Z)
>  #define PAREN(X, Y) (X == Y)
>  #define ID(X) (X)
> -int main(int argc, char *argv[])
> +int main(void)
>  {
>      int x = 0, y = 0;
>      x = ID(x);

No objection to the cases where we can pass "void", that's
a neater way to write the test anyway.

thanks
-- PMM

