Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XMd8C-0005jc-L5
	for mharc-qemu-trivial@gnu.org; Wed, 27 Aug 2014 09:19:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57407)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1XMd86-0005al-7c
	for qemu-trivial@nongnu.org; Wed, 27 Aug 2014 09:19:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1XMd81-0001NY-Ce
	for qemu-trivial@nongnu.org; Wed, 27 Aug 2014 09:19:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46395)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1XMd7m-0001JO-9w; Wed, 27 Aug 2014 09:18:54 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7RDIVMS031577
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 27 Aug 2014 09:18:31 -0400
Received: from localhost (ovpn-116-113.ams2.redhat.com [10.36.116.113])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7RDISl2015510; Wed, 27 Aug 2014 09:18:29 -0400
Date: Wed, 27 Aug 2014 09:18:27 -0400
From: Luiz Capitulino <lcapitulino@redhat.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
Message-ID: <20140827091827.4de1dc59@redhat.com>
In-Reply-To: <1409138333-12644-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1409138333-12644-1-git-send-email-zhang.zhanghailiang@huawei.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, luonengjun@huawei.com, lersek@redhat.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH] dump: let dump_error printf the error
	reason
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
X-List-Received-Date: Wed, 27 Aug 2014 13:19:19 -0000

On Wed, 27 Aug 2014 19:18:53 +0800
zhanghailiang <zhang.zhanghailiang@huawei.com> wrote:

> The second parameter of dump_error is unused, but one purpose of
> using this function is to report the error info.
> 
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  dump.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/dump.c b/dump.c
> index 71d3e94..0f44e9d 100644
> --- a/dump.c
> +++ b/dump.c
> @@ -83,6 +83,9 @@ static int dump_cleanup(DumpState *s)
>  
>  static void dump_error(DumpState *s, const char *reason)
>  {
> +    if (reason) {
> +        error_report("%s", reason);
> +    }
>      dump_cleanup(s);
>  }
>  

Good catch, but error_report() will report the error only to the user. This
is QMP code, so we have to use the Error API.

I think that the best way to solve this is to make dump_error() fill an
Error object (eg. by calling error_setg()) and then returning it after
the call to dump_cleanup(). Of course that you will have to change _all_
code paths calling dump_error() to propagate the error up.

For more information on this, please read docs/writing-qmp-commands.txt.
You can also take a look at simple commands doing error propagation, like
qmp_cont() or qmp_block_passwd().

