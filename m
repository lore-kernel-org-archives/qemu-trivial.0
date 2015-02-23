Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YPz7g-0003eY-P6
	for mharc-qemu-trivial@gnu.org; Mon, 23 Feb 2015 14:56:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1YPz7e-0003eN-ME
	for qemu-trivial@nongnu.org; Mon, 23 Feb 2015 14:56:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1YPz7b-0004Ao-Gz
	for qemu-trivial@nongnu.org; Mon, 23 Feb 2015 14:56:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54223)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1YPz7b-0004Ak-8u; Mon, 23 Feb 2015 14:56:51 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1NJu76r005772
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 23 Feb 2015 14:56:07 -0500
Received: from scv.usersys.redhat.com (dhcp-17-161.bos.redhat.com
	[10.18.17.161])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1NJu78B019460; Mon, 23 Feb 2015 14:56:07 -0500
Message-ID: <54EB85D6.1020509@redhat.com>
Date: Mon, 23 Feb 2015 14:56:06 -0500
From: John Snow <jsnow@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <1424458395-31906-1-git-send-email-berto@igalia.com>
In-Reply-To: <1424458395-31906-1-git-send-email-berto@igalia.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: "qemu-trivial >> QEMU Trivial" <qemu-trivial@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qerror.h: Swap definitions
 that were not in alphabetical order
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
X-List-Received-Date: Mon, 23 Feb 2015 19:56:55 -0000



On 02/20/2015 01:53 PM, Alberto Garcia wrote:
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>   include/qapi/qmp/qerror.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
> index 986260f..57a62d4 100644
> --- a/include/qapi/qmp/qerror.h
> +++ b/include/qapi/qmp/qerror.h
> @@ -37,12 +37,12 @@ void qerror_report_err(Error *err);
>   #define QERR_BASE_NOT_FOUND \
>       ERROR_CLASS_GENERIC_ERROR, "Base '%s' not found"
>
> -#define QERR_BLOCK_JOB_NOT_READY \
> -    ERROR_CLASS_GENERIC_ERROR, "The active block job for device '%s' cannot be completed"
> -
>   #define QERR_BLOCK_FORMAT_FEATURE_NOT_SUPPORTED \
>       ERROR_CLASS_GENERIC_ERROR, "Block format '%s' used by device '%s' does not support feature '%s'"
>
> +#define QERR_BLOCK_JOB_NOT_READY \
> +    ERROR_CLASS_GENERIC_ERROR, "The active block job for device '%s' cannot be completed"
> +
>   #define QERR_BUS_NO_HOTPLUG \
>       ERROR_CLASS_GENERIC_ERROR, "Bus '%s' does not support hotplugging"
>
>

Cc: qemu-trivial@nongnu.org

Reviewed-by: John Snow <jsnow@redhat.com>

