Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnO9O-0008KD-KM
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2013 03:10:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33391)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>) id 1UnO9M-0008GE-3m
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 03:10:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>) id 1UnO9K-00078Y-JC
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 03:10:20 -0400
Received: from [222.73.24.84] (port=36864 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hutao@cn.fujitsu.com>)
	id 1UnO9D-000748-CZ; Fri, 14 Jun 2013 03:10:11 -0400
X-IronPort-AV: E=Sophos;i="4.87,863,1363104000"; 
   d="scan'208";a="7545344"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 14 Jun 2013 15:07:14 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r5E7A7LD028347;
	Fri, 14 Jun 2013 15:10:07 +0800
Received: from localhost ([10.167.233.156])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013061415081111-2125120 ;
	Fri, 14 Jun 2013 15:08:11 +0800 
Date: Fri, 14 Jun 2013 15:09:21 +0800
From: Hu Tao <hutao@cn.fujitsu.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Message-ID: <20130614070921.GG13787@G08FNSTD100614.fnst.cn.fujitsu.com>
References: <1371120709-18923-1-git-send-email-hutao@cn.fujitsu.com>
	<1371120709-18923-3-git-send-email-hutao@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1371120709-18923-3-git-send-email-hutao@cn.fujitsu.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/06/14 15:08:11,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/06/14 15:08:11,
	Serialize complete at 2013/06/14 15:08:11
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] remove call to
 type_initialize in object_new_with_type
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
X-List-Received-Date: Fri, 14 Jun 2013 07:10:21 -0000

On Thu, Jun 13, 2013 at 06:51:49PM +0800, Hu Tao wrote:
> Since it's called in object_initialize_with_type later.
> 
> Signed-off-by: Hu Tao <hutao@cn.fujitsu.com>
> ---
>  qom/object.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/qom/object.c b/qom/object.c
> index 803b94b..38dc45e 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -406,9 +406,6 @@ Object *object_new_with_type(Type type)
>  {
>      Object *obj;
>  
> -    g_assert(type != NULL);
> -    type_initialize(type);
> -
>      obj = g_malloc(type->instance_size);

Well, type->instance_size has to be initialized before this.

>      object_initialize_with_type(obj, type);
>      obj->free = g_free;
> -- 
> 1.8.2.3
> 

