Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RLMil-0005tL-30
	for mharc-qemu-trivial@gnu.org; Tue, 01 Nov 2011 18:22:15 -0400
Received: from eggs.gnu.org ([140.186.70.92]:38755)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RLMig-0005dM-Ju
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2011 18:22:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RLMif-0000jk-Ag
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2011 18:22:10 -0400
Received: from mail-yw0-f45.google.com ([209.85.213.45]:47111)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>)
	id 1RLMib-0000iv-WA; Tue, 01 Nov 2011 18:22:06 -0400
Received: by ywb3 with SMTP id 3so9306094ywb.4
	for <multiple recipients>; Tue, 01 Nov 2011 15:22:05 -0700 (PDT)
Received: by 10.150.148.4 with SMTP id v4mr2752949ybd.58.1320186125416;
	Tue, 01 Nov 2011 15:22:05 -0700 (PDT)
Received: from [192.168.0.103] (cpe-70-123-132-139.austin.res.rr.com.
	[70.123.132.139])
	by mx.google.com with ESMTPS id r5sm990781anl.13.2011.11.01.15.22.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Nov 2011 15:22:04 -0700 (PDT)
Message-ID: <4EB0710A.6000607@codemonkey.ws>
Date: Tue, 01 Nov 2011 17:22:02 -0500
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.21) Gecko/20110831 Lightning/1.0b2 Thunderbird/3.1.13
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1320172375-28019-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1320172375-28019-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.213.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Suppress
 messages from pkg_config probe for check
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Nov 2011 22:22:11 -0000

On 11/01/2011 01:32 PM, Peter Maydell wrote:
> Suppress confusing messages from pkg_config when probing for
> 'check' by sending them to /dev/null as we do with other
> similar probes.
>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>

Applied.  Thanks.

Regards,

Anthony Liguori

> ---
> We didn't notice this before because we only recently
> changed the default for whether configure probed for this.
> I think that makes this a regression we should fix for 1.0.
>
>   configure |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/configure b/configure
> index 28667fe..9661b0e 100755
> --- a/configure
> +++ b/configure
> @@ -1828,7 +1828,7 @@ if test "$check_utests" != "no" ; then
>   #include<check.h>
>   int main(void) { suite_create("qemu test"); return 0; }
>   EOF
> -  check_libs=`$pkg_config --libs check`
> +  check_libs=`$pkg_config --libs check 2>/dev/null`
>     if compile_prog "" $check_libs ; then
>       check_utests=yes
>       libs_tools="$check_libs $libs_tools"


