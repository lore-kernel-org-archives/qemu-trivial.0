Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WFy9Z-0000lu-9p
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2014 22:48:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>) id 1WFy9T-0000ks-9t
	for qemu-trivial@nongnu.org; Tue, 18 Feb 2014 22:48:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>) id 1WFy9M-0000fF-NG
	for qemu-trivial@nongnu.org; Tue, 18 Feb 2014 22:48:51 -0500
Received: from [222.73.24.84] (port=1529 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>)
	id 1WFy9M-0000Ym-BL; Tue, 18 Feb 2014 22:48:44 -0500
X-IronPort-AV: E=Sophos;i="4.97,503,1389715200"; 
   d="scan'208";a="9557269"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 19 Feb 2014 11:44:34 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id s1J3mNsQ028534;
	Wed, 19 Feb 2014 11:48:23 +0800
Received: from localhost ([10.167.226.102])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2014021911461420-29692 ;
	Wed, 19 Feb 2014 11:46:14 +0800 
Date: Wed, 19 Feb 2014 11:46:37 +0800
From: Hu Tao <hutao@cn.fujitsu.com>
To: Hani Benhabiles <kroosec@gmail.com>
Message-ID: <20140219034636.GA20007@G08FNSTD100614.fnst.cn.fujitsu.com>
References: <1392763356-29026-1-git-send-email-kroosec@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1392763356-29026-1-git-send-email-kroosec@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2014/02/19 11:46:14,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2014/02/19 11:46:15,
	Serialize complete at 2014/02/19 11:46:15
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: qemu-trivial@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	qemu-devel@nongnu.org, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] object: Report type in
 error when not user creatable.
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
X-List-Received-Date: Wed, 19 Feb 2014 03:48:55 -0000

cced: Igor

On Tue, Feb 18, 2014 at 11:42:36PM +0100, Hani Benhabiles wrote:
> Signed-off-by: Hani Benhabiles <hani@linux.com>
> ---
>  qmp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/qmp.c b/qmp.c
> index d0d98e7..f556a04 100644
> --- a/qmp.c
> +++ b/qmp.c
> @@ -556,8 +556,8 @@ void object_add(const char *type, const char *id, const QDict *qdict,
>      }
>  
>      if (!object_dynamic_cast(obj, TYPE_USER_CREATABLE)) {
> -        error_setg(&local_err, "object '%s' isn't supported by object-add",
> -                   id);
> +        error_setg(&local_err, "object type '%s' isn't supported by object-add",
> +                   type);
>          goto out;
>      }

Same problem here. In the case what we should let user know is the
type of object, instead of id which is just a normal property of object.

Reviewed-by: Hu Tao <hutao@cn.fujitsu.com>

