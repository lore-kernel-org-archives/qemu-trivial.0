Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WIDa0-0006uH-FF
	for mharc-qemu-trivial@gnu.org; Tue, 25 Feb 2014 03:41:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WIDZt-0006nK-U2
	for qemu-trivial@nongnu.org; Tue, 25 Feb 2014 03:41:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WIDZo-000126-S4
	for qemu-trivial@nongnu.org; Tue, 25 Feb 2014 03:41:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58336)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1WIDZb-0000vQ-HJ; Tue, 25 Feb 2014 03:41:07 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1P8f41i010853
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 25 Feb 2014 03:41:05 -0500
Received: from blackfin.pond.sub.org (ovpn-116-51.ams2.redhat.com
	[10.36.116.51])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s1P8f33W007190
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 25 Feb 2014 03:41:04 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 91942200CF; Tue, 25 Feb 2014 09:41:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Hani Benhabiles <kroosec@gmail.com>
References: <1393312205-7858-1-git-send-email-kroosec@gmail.com>
Date: Tue, 25 Feb 2014 09:41:02 +0100
In-Reply-To: <1393312205-7858-1-git-send-email-kroosec@gmail.com> (Hani
	Benhabiles's message of "Tue, 25 Feb 2014 08:10:05 +0100")
Message-ID: <87txbnshy9.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, peter.crosthwaite@xilinx.com,
	qemu-devel@nongnu.org, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qerror: Improve
	QERR_DEVICE_NOT_ACTIVE message
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
X-List-Received-Date: Tue, 25 Feb 2014 08:41:31 -0000

Hani Benhabiles <kroosec@gmail.com> writes:

> The error message as currently used is confusing as there are no "balloon" or
> "spice" devices.
>
> (qemu) balloon 1024
> balloon: Device 'balloon' has not been activated
>
> With this patch:
>
> (qemu) balloon 1024
> balloon: No balloon device has been activated
>
> Signed-off-by: Hani Benhabiles <hani@linux.com>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> ---
>  include/qapi/qmp/qerror.h | 2 +-
>  qmp.c                     | 2 --
>  2 files changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
> index 73c67b7..25193c9 100644
> --- a/include/qapi/qmp/qerror.h
> +++ b/include/qapi/qmp/qerror.h
> @@ -105,7 +105,7 @@ void qerror_report_err(Error *err);
>      ERROR_CLASS_GENERIC_ERROR, "Device '%s' does not support hotplugging"
>  
>  #define QERR_DEVICE_NOT_ACTIVE \
> -    ERROR_CLASS_DEVICE_NOT_ACTIVE, "Device '%s' has not been activated"
> +    ERROR_CLASS_DEVICE_NOT_ACTIVE, "No %s device has been activated"
>  
>  #define QERR_DEVICE_NOT_ENCRYPTED \
>      ERROR_CLASS_GENERIC_ERROR, "Device '%s' is not encrypted"
> diff --git a/qmp.c b/qmp.c
> index d0d98e7..ffddd26 100644
> --- a/qmp.c
> +++ b/qmp.c
> @@ -289,7 +289,6 @@ void qmp_set_password(const char *protocol, const char *password,
>  
>      if (strcmp(protocol, "spice") == 0) {
>          if (!using_spice) {
> -            /* correct one? spice isn't a device ,,, */
>              error_set(errp, QERR_DEVICE_NOT_ACTIVE, "spice");
>              return;
>          }
> @@ -337,7 +336,6 @@ void qmp_expire_password(const char *protocol, const char *whenstr,
>  
>      if (strcmp(protocol, "spice") == 0) {
>          if (!using_spice) {
> -            /* correct one? spice isn't a device ,,, */
>              error_set(errp, QERR_DEVICE_NOT_ACTIVE, "spice");
>              return;
>          }

The wording of the error message is still suboptimal for the
!using_spice case, but it's an improvement.  I'd leave the two comments
alone, though.  Hani, if you agree, then Luiz could perhaps merge your
patch with these two hunks dropped.

Reviewed-by: Markus Armbruster <armbru@redhat.com>

