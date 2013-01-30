Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U0VnS-0004gQ-U3
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2013 06:25:42 -0500
Received: from eggs.gnu.org ([208.118.235.92]:55606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1U0VnQ-0004Y3-5f
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2013 06:25:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1U0VnP-0006C1-97
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2013 06:25:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50319)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1U0VnM-0006BV-Vd; Wed, 30 Jan 2013 06:25:37 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0UBPakK010746
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 30 Jan 2013 06:25:36 -0500
Received: from localhost (ovpn-113-71.phx2.redhat.com [10.3.113.71])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0UBPYPi028626; Wed, 30 Jan 2013 06:25:35 -0500
Date: Wed, 30 Jan 2013 09:25:34 -0200
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Michal Privoznik <mprivozn@redhat.com>
Message-ID: <20130130092534.4836b142@redhat.com>
In-Reply-To: <8f03011d18d9d8cb51a4c2339f2ae4be7cfe1052.1359478671.git.mprivozn@redhat.com>
References: <8f03011d18d9d8cb51a4c2339f2ae4be7cfe1052.1359478671.git.mprivozn@redhat.com>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] qmp-commands.hx:
 s/tray-open/tray_open/ to match qapi schema
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
X-List-Received-Date: Wed, 30 Jan 2013 11:25:41 -0000

On Tue, 29 Jan 2013 17:58:41 +0100
Michal Privoznik <mprivozn@redhat.com> wrote:

> Currently, we are using 'tray_open' in QMP and 'tray-open' in
> HMP. However, the QMP documentation was mistakenly using the
> HMP version.
> 
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>

Reviewed-by: Luiz Capitulino <lcapitulino@redhat.com>

> ---
> 
> diff to v1:
> -add S-o-b line
> 
>  qmp-commands.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qmp-commands.hx b/qmp-commands.hx
> index f58a841..f90efe5 100644
> --- a/qmp-commands.hx
> +++ b/qmp-commands.hx
> @@ -1659,7 +1659,7 @@ Each json-object contain the following:
>           - Possible values: "unknown"
>  - "removable": true if the device is removable, false otherwise (json-bool)
>  - "locked": true if the device is locked, false otherwise (json-bool)
> -- "tray-open": only present if removable, true if the device has a tray,
> +- "tray_open": only present if removable, true if the device has a tray,
>                 and it is open (json-bool)
>  - "inserted": only present if the device is inserted, it is a json-object
>     containing the following:


