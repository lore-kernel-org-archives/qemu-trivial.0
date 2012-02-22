Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S0HJl-0000Ce-AH
	for mharc-qemu-trivial@gnu.org; Wed, 22 Feb 2012 13:53:33 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1S0HJf-0008NB-DY
	for qemu-trivial@nongnu.org; Wed, 22 Feb 2012 13:53:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1S0HJd-0001Qr-RJ
	for qemu-trivial@nongnu.org; Wed, 22 Feb 2012 13:53:27 -0500
Received: from mail-pw0-f45.google.com ([209.85.160.45]:65325)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>)
	id 1S0HJY-0001Pv-8u; Wed, 22 Feb 2012 13:53:20 -0500
Received: by pbbro12 with SMTP id ro12so566435pbb.4
	for <multiple recipients>; Wed, 22 Feb 2012 10:53:19 -0800 (PST)
Received: by 10.68.220.196 with SMTP id py4mr70032590pbc.166.1329936799051;
	Wed, 22 Feb 2012 10:53:19 -0800 (PST)
Received: from [192.168.0.108] (cpe-70-123-132-139.austin.res.rr.com.
	[70.123.132.139])
	by mx.google.com with ESMTPS id f10sm19629920pbn.58.2012.02.22.10.53.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Feb 2012 10:53:17 -0800 (PST)
Message-ID: <4F45399B.4060208@codemonkey.ws>
Date: Wed, 22 Feb 2012 12:53:15 -0600
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
References: <1329695347-9289-1-git-send-email-afaerber@suse.de>
In-Reply-To: <1329695347-9289-1-git-send-email-afaerber@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Gm-Message-State: ALoCoQmVBEAcoj8Y6bM12O1WT0bA9EG6Nmij0kJfGYSs/IdPSBfkyBYkPF1a139fEsNYWTHqgNTp
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qom: Fix
	object_initialize_with_type() assertion
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
X-List-Received-Date: Wed, 22 Feb 2012 18:53:31 -0000

On 02/19/2012 05:49 PM, Andreas Färber wrote:
> Assert the object is at least sizeof(Object), not sizeof(ObjectClass).
>
> Signed-off-by: Andreas Färber<afaerber@suse.de>

Applied.  Thanks.

Regards,

Anthony Liguori

> ---
>   qom/object.c |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/qom/object.c b/qom/object.c
> index b1ead15..dbfd6a4 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -262,7 +262,7 @@ void object_initialize_with_type(void *data, TypeImpl *type)
>       Object *obj = data;
>
>       g_assert(type != NULL);
> -    g_assert(type->instance_size>= sizeof(ObjectClass));
> +    g_assert(type->instance_size>= sizeof(Object));
>
>       type_class_init(type);
>       g_assert(type->abstract == false);


