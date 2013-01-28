Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TzpcE-0007wj-2T
	for mharc-qemu-trivial@gnu.org; Mon, 28 Jan 2013 09:23:18 -0500
Received: from eggs.gnu.org ([208.118.235.92]:40982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1Tzofc-0004FB-NK
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2013 08:22:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1TzofY-0006Yz-44
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2013 08:22:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46304)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1TzofV-0006YH-SJ; Mon, 28 Jan 2013 08:22:38 -0500
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0SDMbD2006954
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 28 Jan 2013 08:22:37 -0500
Received: from doriath.home (ovpn-113-108.phx2.redhat.com [10.3.113.108])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r0SDMZJc019919; Mon, 28 Jan 2013 08:22:36 -0500
Date: Mon, 28 Jan 2013 11:22:47 -0200
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Michal Privoznik <mprivozn@redhat.com>
Message-ID: <20130128112247.1a3ca03f@doriath.home>
In-Reply-To: <ef9bb01f7a2cd566bcdc10f19dc0881818754c4e.1359120428.git.mprivozn@redhat.com>
References: <ef9bb01f7a2cd566bcdc10f19dc0881818754c4e.1359120428.git.mprivozn@redhat.com>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qmp-commands.hx:
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
X-List-Received-Date: Mon, 28 Jan 2013 14:23:16 -0000

On Fri, 25 Jan 2013 14:27:11 +0100
Michal Privoznik <mprivozn@redhat.com> wrote:

> Currently, we are using 'tray_open' in QMP and 'tray-open' in
> HMP. However, the QMP documentation was mistakenly using the
> HMP version.

It's missing the s-o-b line.

> ---
>  qmp-commands.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qmp-commands.hx b/qmp-commands.hx
> index cbf1280..870ee54 100644
> --- a/qmp-commands.hx
> +++ b/qmp-commands.hx
> @@ -1585,7 +1585,7 @@ Each json-object contain the following:
>           - Possible values: "unknown"
>  - "removable": true if the device is removable, false otherwise (json-bool)
>  - "locked": true if the device is locked, false otherwise (json-bool)
> -- "tray-open": only present if removable, true if the device has a tray,
> +- "tray_open": only present if removable, true if the device has a tray,
>                 and it is open (json-bool)
>  - "inserted": only present if the device is inserted, it is a json-object
>     containing the following:


