Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fIEh4-0000EZ-3c
	for mharc-qemu-trivial@gnu.org; Mon, 14 May 2018 10:43:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54039)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fIEh1-0000C0-JF
	for qemu-trivial@nongnu.org; Mon, 14 May 2018 10:43:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fIEh0-0004gU-P5
	for qemu-trivial@nongnu.org; Mon, 14 May 2018 10:43:15 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34842 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fIEgv-0004bp-Qo; Mon, 14 May 2018 10:43:09 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D018F818F714;
	Mon, 14 May 2018 14:43:03 +0000 (UTC)
Received: from [10.36.118.71] (unknown [10.36.118.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 263A911166E0;
	Mon, 14 May 2018 14:43:03 +0000 (UTC)
To: Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
References: <9dbde2b5d864d126b75d8c0d7bae2011e8cc7e9b.1526305502.git.mprivozn@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <9ff0bc35-8996-599a-9478-07f6e1e54596@redhat.com>
Date: Mon, 14 May 2018 16:43:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <9dbde2b5d864d126b75d8c0d7bae2011e8cc7e9b.1526305502.git.mprivozn@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 14 May 2018 14:43:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 14 May 2018 14:43:03 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-options: Allow
 -no-user-config again
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
X-List-Received-Date: Mon, 14 May 2018 14:43:16 -0000

On 14.05.2018 15:45, Michal Privoznik wrote:
> After 1217d6ca2bf28c0febe1bd7d5b3fa912bbf6af2a we error out
> explicitly if an unknown -option was passed on the command line.
> However, we are doing two pass command line option parsing. In
> the first pass we just look for -no-user-config or -nodefconfig
> being present which determines whether we load user config or
> not. Then in the second pass we finally parse everything else
> throwing an error if an unsupported -option was found. Problem is
> that in the second pass -no-user-config and -nodefconfig are not
> handled explicitly which makes us throw the unsupported option
> error.
> 
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> ---
>  vl.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/vl.c b/vl.c
> index b9f6b42779..846cd29d8a 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -4015,6 +4015,10 @@ int main(int argc, char **argv, char **envp)
>                      exit(1);
>                  }
>                  break;
> +            case QEMU_OPTION_nodefconfig:
> +            case QEMU_OPTION_nouserconfig:
> +                /* Nothing to be parsed here. Especially, do not error out below. */
> +                break;
>              default:
>                  if (os_parse_cmd_args(popt->index, optarg)) {
>                      error_report("Option not supported in this build");
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>

