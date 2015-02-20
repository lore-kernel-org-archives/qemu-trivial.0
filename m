Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YOrUN-0005xh-Sj
	for mharc-qemu-trivial@gnu.org; Fri, 20 Feb 2015 12:35:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42925)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YOrUJ-0005vR-Rn
	for qemu-trivial@nongnu.org; Fri, 20 Feb 2015 12:35:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YOrUG-0001jS-96
	for qemu-trivial@nongnu.org; Fri, 20 Feb 2015 12:35:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41660)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YOrUG-0001jC-1K
	for qemu-trivial@nongnu.org; Fri, 20 Feb 2015 12:35:36 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1KHYoua008210
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 20 Feb 2015 12:34:50 -0500
Received: from blackfin.pond.sub.org (ovpn-116-39.ams2.redhat.com
	[10.36.116.39])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1KHYmVU011932
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 20 Feb 2015 12:34:49 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 9510D3046039; Fri, 20 Feb 2015 18:34:47 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Alberto Garcia <berto@igalia.com>
References: <1424437103-17523-1-git-send-email-berto@igalia.com>
Date: Fri, 20 Feb 2015 18:34:47 +0100
In-Reply-To: <1424437103-17523-1-git-send-email-berto@igalia.com> (Alberto
	Garcia's message of "Fri, 20 Feb 2015 14:58:23 +0200")
Message-ID: <874mqg1o7c.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qerror.h: Swap definitions that were not
	in alphabetical order
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
X-List-Received-Date: Fri, 20 Feb 2015 17:35:42 -0000

Looks good, except you need to send to qemu-devel@nongnu.org in addition
to qemu-trivial.  Thanks!

Alberto Garcia <berto@igalia.com> writes:

> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>  include/qapi/qmp/qerror.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
> index 986260f..57a62d4 100644
> --- a/include/qapi/qmp/qerror.h
> +++ b/include/qapi/qmp/qerror.h
> @@ -37,12 +37,12 @@ void qerror_report_err(Error *err);
>  #define QERR_BASE_NOT_FOUND \
>      ERROR_CLASS_GENERIC_ERROR, "Base '%s' not found"
>  
> -#define QERR_BLOCK_JOB_NOT_READY \
> -    ERROR_CLASS_GENERIC_ERROR, "The active block job for device '%s' cannot be completed"
> -
>  #define QERR_BLOCK_FORMAT_FEATURE_NOT_SUPPORTED \
>      ERROR_CLASS_GENERIC_ERROR, "Block format '%s' used by device '%s' does not support feature '%s'"
>  
> +#define QERR_BLOCK_JOB_NOT_READY \
> +    ERROR_CLASS_GENERIC_ERROR, "The active block job for device '%s' cannot be completed"
> +
>  #define QERR_BUS_NO_HOTPLUG \
>      ERROR_CLASS_GENERIC_ERROR, "Bus '%s' does not support hotplugging"

