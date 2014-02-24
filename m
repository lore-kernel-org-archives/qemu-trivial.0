Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WHrSn-0002V6-0N
	for mharc-qemu-trivial@gnu.org; Mon, 24 Feb 2014 04:04:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46241)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WHrSg-0002ME-Dq
	for qemu-trivial@nongnu.org; Mon, 24 Feb 2014 04:04:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WHrSb-000830-6h
	for qemu-trivial@nongnu.org; Mon, 24 Feb 2014 04:04:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:13245)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1WHrSQ-0007u7-TG; Mon, 24 Feb 2014 04:04:15 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1O94ADp025226
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Feb 2014 04:04:11 -0500
Received: from blackfin.pond.sub.org (ovpn-116-42.ams2.redhat.com
	[10.36.116.42])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s1O946EB000469
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 24 Feb 2014 04:04:07 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E0289200CF; Mon, 24 Feb 2014 10:04:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Hani Benhabiles <kroosec@gmail.com>
References: <1393164341-7196-1-git-send-email-kroosec@gmail.com>
Date: Mon, 24 Feb 2014 10:04:05 +0100
In-Reply-To: <1393164341-7196-1-git-send-email-kroosec@gmail.com> (Hani
	Benhabiles's message of "Sun, 23 Feb 2014 15:05:41 +0100")
Message-ID: <8738j86fwa.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] balloon: Fix device name in
	error message.
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
X-List-Received-Date: Mon, 24 Feb 2014 09:04:35 -0000

Hani Benhabiles <kroosec@gmail.com> writes:

> Also fix trailing whitespace.
>
> Signed-off-by: Hani Benhabiles <hani@linux.com>
> ---
>  balloon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/balloon.c b/balloon.c
> index e321f2c..b66710a 100644
> --- a/balloon.c
> +++ b/balloon.c
> @@ -125,8 +125,8 @@ void qmp_balloon(int64_t value, Error **errp)
>          error_set(errp, QERR_INVALID_PARAMETER_VALUE, "target", "a size");
>          return;
>      }
> -    
> +
>      if (qemu_balloon(value) == 0) {
> -        error_set(errp, QERR_DEVICE_NOT_ACTIVE, "balloon");
> +        error_set(errp, QERR_DEVICE_NOT_ACTIVE, "virtio-balloon-pci");
>      }
>  }

I agree the error message is bad, but I'm afraid your patch makes it
worse :)

qemu_balloon() returns zero when balloon_event_fn has not been set with
qemu_add_balloon_handler().

Right now, the only device that calls qemu_add_balloon_handler() is
virtio-balloon-device.  In theory, there could be others in the future.

virtio-balloon-device is a virtio-bus device.  The bus can be provided
by virtio-balloon-pci or virtio-balloon-ccw.

Your error message is misleading when it's provided by the latter.

Moreover, you missed qmp_query_balloon().

QERR_DEVICE_NOT_ACTIVE is also used with argument "spice", and the
resulting error message is similarly bad.  Perhaps something like this
would do:

#define QERR_DEVICE_NOT_ACTIVE \
    ERROR_CLASS_DEVICE_NOT_ACTIVE, "No %s device has been activated"

