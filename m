Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnVzl-00036Q-3Y
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2013 11:32:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UnTe8-0004Cb-Qd
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 09:02:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UnTe7-0000vv-K9
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 09:02:28 -0400
Received: from mail-bk0-x22c.google.com ([2a00:1450:4008:c01::22c]:37417)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UnTe7-0000vj-DU
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 09:02:27 -0400
Received: by mail-bk0-f44.google.com with SMTP id r7so257984bkg.3
	for <qemu-trivial@nongnu.org>; Fri, 14 Jun 2013 06:02:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=p3d4hwFjnUshMZpIM8y0z2egQya1Gqx7q5RLPilLXi8=;
	b=pUKH9EJfK9flqN3wn6cIApAAeoEvVxdlqYqoesF2CaH39H5HCg4Sg5cYzeRBHoZk92
	uwFFwM5lyl5SdNoqRxbd+SIqpE7//DuVVcTdZiUSfIaTjk6KuDZ84EV71Fn7wZffEtBB
	0Lse01FIzcehHS1GRAMWg6X2xTZihoEdburR1AsPPKLMMGGCRqh0lQNuwyUEmJl0rA1r
	JmV53+1ofl2fxcNXOCUZ0uispwAVXtc9b6QDllVWhscUZA0EUZcCAkpdBushLaPYl78P
	U/m9x35A66Qa77u/gV/78WKBx04v3rl+iWVDkAp3u1iX5B7jBz2mSyRB9FVGzo3bakrv
	wG+Q==
MIME-Version: 1.0
X-Received: by 10.204.190.7 with SMTP id dg7mr337748bkb.52.1371214946109; Fri,
	14 Jun 2013 06:02:26 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.204.35.136 with HTTP; Fri, 14 Jun 2013 06:02:25 -0700 (PDT)
In-Reply-To: <1371120709-18923-3-git-send-email-hutao@cn.fujitsu.com>
References: <1371120709-18923-1-git-send-email-hutao@cn.fujitsu.com>
	<1371120709-18923-3-git-send-email-hutao@cn.fujitsu.com>
Date: Fri, 14 Jun 2013 23:02:25 +1000
X-Google-Sender-Auth: dx8FHTvS-WmaE_GhQEm52Va0VSA
Message-ID: <CAEgOgz5MM5eWWMNF=XnZDyds9Y1rG650xB9CDaEx1BWW4EfHHw@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Hu Tao <hutao@cn.fujitsu.com>
Content-Type: text/plain; charset=ISO-8859-1
X-Gm-Message-State: ALoCoQlGk+yrBQ7P2oVZ7Tg2igWQYyrGUnwK6OkbPMvFZ40Sgz5RHxe4+VHQDiGlhhnWIcPfPyj4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4008:c01::22c
X-Mailman-Approved-At: Fri, 14 Jun 2013 11:32:54 -0400
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
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
X-List-Received-Date: Fri, 14 Jun 2013 13:02:31 -0000

Hi Hu,

On Thu, Jun 13, 2013 at 8:51 PM, Hu Tao <hutao@cn.fujitsu.com> wrote:
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

type->instance_size may be lazily set by type_initilize, so I think
this malloc will break for classes that inherit their instance size.
Some relevant code (qom/object.c):

228 static void type_initialize(TypeImpl *ti)
 229 {
[snip]
 236     ti->class_size = type_class_get_size(ti);
 237     ti->instance_size = type_object_get_size(ti);

 176 static size_t type_object_get_size(TypeImpl *ti)
 177 {
 178     if (ti->instance_size) {
 179         return ti->instance_size;
 180     }
 181
 182     if (type_has_parent(ti)) {
 183         return type_object_get_size(type_get_parent(ti));
 184     }
 185
 186     return 0;
 187 }

Regards,
Peter

>      object_initialize_with_type(obj, type);
>      obj->free = g_free;
> --
> 1.8.2.3
>
>

