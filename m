Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bCimR-0003r7-Oj
	for mharc-qemu-trivial@gnu.org; Tue, 14 Jun 2016 03:29:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bCimP-0003pj-Vq
	for qemu-trivial@nongnu.org; Tue, 14 Jun 2016 03:28:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bCimO-0006ue-3w
	for qemu-trivial@nongnu.org; Tue, 14 Jun 2016 03:28:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38938)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bCimH-0006rq-8Q; Tue, 14 Jun 2016 03:28:49 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 380408553B;
	Tue, 14 Jun 2016 07:28:48 +0000 (UTC)
Received: from [10.36.112.40] (ovpn-112-40.ams2.redhat.com [10.36.112.40])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5E7SkA1024710; Tue, 14 Jun 2016 03:28:46 -0400
To: Changlong Xie <xiecl.fnst@cn.fujitsu.com>,
	qemu trival <qemu-trivial@nongnu.org>, =?UTF-8?Q?Andreas_F=c3=a4rber?=
	<afaerber@suse.de>, qemu devel <qemu-devel@nongnu.org>
References: <1465889269-7226-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <86fb2451-2255-87c9-2bf7-bd316c7b6f29@redhat.com>
Date: Tue, 14 Jun 2016 09:28:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <1465889269-7226-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 14 Jun 2016 07:28:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qom/object: fix comment typo
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
X-List-Received-Date: Tue, 14 Jun 2016 07:28:59 -0000



On 14/06/2016 09:27, Changlong Xie wrote:
> Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>

Reviewed-by: Laurent Vivier <lvivier@redhat.com>

> ---
>  include/qom/object.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/qom/object.h b/include/qom/object.h
> index 99de539..925c279 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -901,7 +901,7 @@ GSList *object_class_get_list(const char *implements_type,
>  void object_ref(Object *obj);
>  
>  /**
> - * qdef_unref:
> + * object_unref:
>   * @obj: the object
>   *
>   * Decrease the reference count of a object.  A object cannot be freed as long
> 

