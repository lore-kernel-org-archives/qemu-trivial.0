Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZDUcF-00026l-3Q
	for mharc-qemu-trivial@gnu.org; Fri, 10 Jul 2015 05:29:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60406)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1ZDUcB-00021u-QZ
	for qemu-trivial@nongnu.org; Fri, 10 Jul 2015 05:29:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>) id 1ZDUcA-0000NH-P7
	for qemu-trivial@nongnu.org; Fri, 10 Jul 2015 05:29:03 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:15175)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Leon.Alrae@imgtec.com>)
	id 1ZDUc5-0000KG-BC; Fri, 10 Jul 2015 05:28:57 -0400
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
	by Websense Email Security Gateway with ESMTPS id A16D186505BB1;
	Fri, 10 Jul 2015 10:28:52 +0100 (IST)
Received: from [192.168.14.47] (192.168.14.47) by KLMAIL01.kl.imgtec.org
	(192.168.5.35) with Microsoft SMTP Server (TLS) id 14.3.195.1;
	Fri, 10 Jul 2015 10:28:54 +0100
Message-ID: <559F9050.5080402@imgtec.com>
Date: Fri, 10 Jul 2015 10:28:48 +0100
From: Leon Alrae <leon.alrae@imgtec.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: <arei.gonglei@huawei.com>, <qemu-devel@nongnu.org>
References: <1436489490-236-1-git-send-email-arei.gonglei@huawei.com>
	<1436489490-236-5-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1436489490-236-5-git-send-email-arei.gonglei@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.14.47]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/4] vl.c: fix memory leak
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
X-List-Received-Date: Fri, 10 Jul 2015 09:29:04 -0000

On 10/07/2015 01:51, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> Failing to save or free storage allocated
> by "g_strdup(cmd)" leaks it. Let's use a
> variable to storage it.
> 
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  vl.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/vl.c b/vl.c
> index 3f269dc..399e816 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -1326,16 +1326,19 @@ static int add_semihosting_arg(void *opaque,
>  static inline void semihosting_arg_fallback(const char *file, const char *cmd)
>  {
>      char *cmd_token;
> +    char *cmd_str;
>  
>      /* argv[0] */
>      add_semihosting_arg(&semihosting, "arg", file, NULL);
>  
> +    cmd_str = g_strdup(cmd);
>      /* split -append and initialize argv[1..n] */
> -    cmd_token = strtok(g_strdup(cmd), " ");
> +    cmd_token = strtok(cmd_str, " ");
>      while (cmd_token) {
>          add_semihosting_arg(&semihosting, "arg", cmd_token, NULL);
>          cmd_token = strtok(NULL, " ");
>      }
> +    g_free(cmd_str);
>  }
>  
>  /***********************************************************/
> 

I don't think this is correct as there's no leak here. This duplicated string
is modified (i.e. split into tokens) and each pointer to the beginning of a
token is saved in the global semihosting.argv[] array which is used later in
target semihosting code. It shouldn't be freed.

Regards,
Leon


