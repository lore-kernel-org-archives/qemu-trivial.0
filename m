Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7NnC-0006pI-Ab
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 08:59:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49271)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sfeldma@gmail.com>) id 1Z7Ggf-0002Id-PP
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 01:23:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sfeldma@gmail.com>) id 1Z7Ggd-0005PA-TZ
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 01:23:57 -0400
Received: from mail-ob0-x22a.google.com ([2607:f8b0:4003:c01::22a]:34526)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sfeldma@gmail.com>) id 1Z7Ggd-0005P3-Nt
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 01:23:55 -0400
Received: by obbkm3 with SMTP id km3so34265991obb.1
	for <qemu-trivial@nongnu.org>; Mon, 22 Jun 2015 22:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=G1JJAKNbfFLlN0oOotKZQZAuh/fkpxPZ++ku9ETUycU=;
	b=FsyMYmwUyk9VW+mF8xpCDZtVZ5ic4lvSOHJb0gd48GehXOWPHtwW+3jQ3SmQH0z5J2
	b8abX7s145tiMUgBtszzmEX4IK1BD/dv8krvD5KLDTET/KQM2zVh7kkyrO2V2Iayj4i5
	6RA4PO9pQ7unatZkfff+yDgxd8QfFAjEodchjr123wqk74oHWupt1gecQgUxZwDcuarH
	RGYd9x8GvumqAaNKERLmwtlymlIbF2fM8qN1ddgGxYr2bCvrHd0nepSVX0azDa8jQGGc
	0jQbJ17X6WuZ6XY2ETQ5p37Za9Eu1mp0Cp+o64YlEroIAjU9sk4ETK36jQbkCp1J/mj8
	Vj6A==
X-Received: by 10.202.108.84 with SMTP id h81mr16694399oic.5.1435037034738;
	Mon, 22 Jun 2015 22:23:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.56.212 with HTTP; Mon, 22 Jun 2015 22:23:35 -0700 (PDT)
In-Reply-To: <1435023111-8780-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1435023111-8780-1-git-send-email-zhang.zhanghailiang@huawei.com>
From: Scott Feldman <sfeldma@gmail.com>
Date: Mon, 22 Jun 2015 22:23:35 -0700
Message-ID: <CAE4R7bCCSh6dd_t42rzSiYs_+nEc8FreT2ij1F0iRGem+TjWow@mail.gmail.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c01::22a
X-Mailman-Approved-At: Tue, 23 Jun 2015 08:59:08 -0400
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>
Subject: Re: [Qemu-trivial] [PATCH] rocker: Fix memory leak reported by
	coverity
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
X-List-Received-Date: Tue, 23 Jun 2015 05:23:58 -0000

On Mon, Jun 22, 2015 at 6:31 PM, zhanghailiang
<zhang.zhanghailiang@huawei.com> wrote:
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  hw/net/rocker/rocker.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
> index 4d25842..d06116e 100644
> --- a/hw/net/rocker/rocker.c
> +++ b/hw/net/rocker/rocker.c
> @@ -103,6 +103,7 @@ RockerSwitch *qmp_query_rocker(const char *name, Error **errp)
>      if (!r) {
>          error_set(errp, ERROR_CLASS_GENERIC_ERROR,
>                    "rocker %s not found", name);
> +        g_free(rocker);
>          return NULL;
>      }

I'll post a patch to fix this one this way, to report alloc failure:

--- a/hw/net/rocker/rocker.c
+++ b/hw/net/rocker/rocker.c
@@ -96,7 +96,7 @@ World *rocker_get_world(Rocker *r, enum
rocker_world_type type)

 RockerSwitch *qmp_query_rocker(const char *name, Error **errp)
 {
-    RockerSwitch *rocker = g_malloc0(sizeof(*rocker));
+    RockerSwitch *rocker;
     Rocker *r;

     r = rocker_find(name);
@@ -106,6 +106,12 @@ RockerSwitch *qmp_query_rocker(const char *name,
Error **errp)
         return NULL;
     }

+    rocker = g_malloc0(sizeof(*rocker));
+    if (!rocker) {
+        error_set(errp, ERROR_CLASS_GENERIC_ERROR, "out-of-memory");
+        return NULL;
+    }
+

