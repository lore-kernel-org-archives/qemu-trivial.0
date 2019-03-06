Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h1Sb4-0005l1-Il
	for mharc-qemu-trivial@gnu.org; Wed, 06 Mar 2019 04:12:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1Sb2-0005jY-Gs
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 04:12:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1Sb1-0003Kj-Hp
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 04:12:16 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:36159)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h1Sb1-0003JE-52; Wed, 06 Mar 2019 04:12:15 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
	1MWiYo-1gUZdE39h2-00X3ff; Wed, 06 Mar 2019 10:12:04 +0100
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	John Snow <jsnow@redhat.com>, Corey Minyard <minyard@acm.org>
References: <1551456970-463-1-git-send-email-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <57cb47b1-9783-6f3d-a4d2-a150029b286a@vivier.eu>
Date: Wed, 6 Mar 2019 10:12:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1551456970-463-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:1B5tQtFjxLzEnKEUpz/M69ARMCyE4VtfJsmsfZLNUlI4zarB+mL
	5frF9nR/WbmTp0oBNN4xR+4P2wCJTwpmN9Y5gbgzHSKaJnXgEVQaf8hZPdyA47uIK3sojHN
	DOHeqOP7K2SfeAx4IhuawaWNzYcGGZ0fRZcxzvhrGikqx+wU4yzWrdBLNx93oxfpuZgzMYV
	aBgrYXFoAda5PbehDzryA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Q8HbBoxM4YM=:ZLHWOApEgCC0N5dMITzDWE
	wEQGyoExCDSFpRxAitIVijClGwnMRHKhDksn44hCZeZ2K6meLtPqIDGquy7ds3/LOm1DbEsYH
	Xgrl2pLqips7UjQQ6sg+mGouNkIwTXsY69nyB7gXL4vxYmJaptyzN62GQsHKfrxazUn5YBedb
	P11BQtvFP96aveibTzj+VIWWLXm6JrYbc1m3NhU8Ph9YEYkjRj6q5E8adygI0tVpoScwENcvb
	nLJdMGIXzHD8d1cRhdYZsE8pa7SEaUo4f9hV6+IRxtWHPeVYumLngYS1HiHGwr58gM1kUNGXC
	hdm5B8yA7lTLPBb8zjKN2ch73UvLkc6T77V0r9n5igcoL8jrEMFKC1qU56Ku8PtlJHqS3MBZ9
	ncnLCmHHv2kd050yJdRQv1MZW3XPqMhaC+9oW5D0x4+cBcL2q5LEMdb9wp3VPfasSerdjE957
	dE7qNs92aAS3dXHzE/V1jf+ydLNKvqSAAe/qA0IA38br03T+HUKNMiK1U9PAT5bkcG/nxSuoj
	iyT0xMRWOD0VAIpl5L8hVO50zooNdIDSUY4+n9fXtFgffNaMhRt1OzFcBGIUNpoE7h6ZmY37V
	5ADdbpoTUsdepspH8wTxvx9jydYM2AHsyC8qCwSYQdSG58VQimRGTkzQJCu6WbAAcAQXRLrc2
	pZO1pC77Ar4ONs8PpH3+qlV0rsB5d0zCM869OrPB1AUDaHXrzfegQRC/K6hrqQTWie1lwh7tE
	MrmyICJ0ZsHNp6Yoa6MRMYf06m0K8lRYLaXFqdOuBp3xfzk12nyNE0jIn/o=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: Re: [Qemu-trivial] [PATCH] tests: Remove (mostly) useless
 architecture checks
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Mar 2019 09:12:17 -0000

On 01/03/2019 17:16, Thomas Huth wrote:
> These checks at the beginning of some of the tests are mostly useless:
> We only run the tests on x86 anyway, and g_test_message() does not
> print anything unless you call g_test_init() first.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/fdc-test.c      | 7 -------
>  tests/ide-test.c      | 7 -------
>  tests/ipmi-bt-test.c  | 7 -------
>  tests/ipmi-kcs-test.c | 7 -------
>  4 files changed, 28 deletions(-)
> 
> diff --git a/tests/fdc-test.c b/tests/fdc-test.c
> index 88f1abf..31cd329 100644
> --- a/tests/fdc-test.c
> +++ b/tests/fdc-test.c
> @@ -548,16 +548,9 @@ static void fuzz_registers(void)
>  
>  int main(int argc, char **argv)
>  {
> -    const char *arch = qtest_get_arch();
>      int fd;
>      int ret;
>  
> -    /* Check architecture */
> -    if (strcmp(arch, "i386") && strcmp(arch, "x86_64")) {
> -        g_test_message("Skipping test for non-x86\n");
> -        return 0;
> -    }
> -
>      /* Create a temporary raw image */
>      fd = mkstemp(test_image);
>      g_assert(fd >= 0);
> diff --git a/tests/ide-test.c b/tests/ide-test.c
> index f0280e6..300d64e 100644
> --- a/tests/ide-test.c
> +++ b/tests/ide-test.c
> @@ -1009,16 +1009,9 @@ static void test_cdrom_dma(void)
>  
>  int main(int argc, char **argv)
>  {
> -    const char *arch = qtest_get_arch();
>      int fd;
>      int ret;
>  
> -    /* Check architecture */
> -    if (strcmp(arch, "i386") && strcmp(arch, "x86_64")) {
> -        g_test_message("Skipping test for non-x86\n");
> -        return 0;
> -    }
> -
>      /* Create temporary blkdebug instructions */
>      fd = mkstemp(debug_path);
>      g_assert(fd >= 0);
> diff --git a/tests/ipmi-bt-test.c b/tests/ipmi-bt-test.c
> index f4a81b5..fc4c83b 100644
> --- a/tests/ipmi-bt-test.c
> +++ b/tests/ipmi-bt-test.c
> @@ -400,15 +400,8 @@ static void open_socket(void)
>  
>  int main(int argc, char **argv)
>  {
> -    const char *arch = qtest_get_arch();
>      int ret;
>  
> -    /* Check architecture */
> -    if (strcmp(arch, "i386") && strcmp(arch, "x86_64")) {
> -        g_test_message("Skipping test for non-x86\n");
> -        return 0;
> -    }
> -
>      open_socket();
>  
>      /* Run the tests */
> diff --git a/tests/ipmi-kcs-test.c b/tests/ipmi-kcs-test.c
> index 178ffc1..a2354c1 100644
> --- a/tests/ipmi-kcs-test.c
> +++ b/tests/ipmi-kcs-test.c
> @@ -263,16 +263,9 @@ static void test_enable_irq(void)
>  
>  int main(int argc, char **argv)
>  {
> -    const char *arch = qtest_get_arch();
>      char *cmdline;
>      int ret;
>  
> -    /* Check architecture */
> -    if (strcmp(arch, "i386") && strcmp(arch, "x86_64")) {
> -        g_test_message("Skipping test for non-x86\n");
> -        return 0;
> -    }
> -
>      /* Run the tests */
>      g_test_init(&argc, &argv, NULL);
>  
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

