Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RaRUC-0001vt-68
	for mharc-qemu-trivial@gnu.org; Tue, 13 Dec 2011 07:29:32 -0500
Received: from eggs.gnu.org ([140.186.70.92]:46928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1RaRU4-0001vg-Ft
	for qemu-trivial@nongnu.org; Tue, 13 Dec 2011 07:29:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1RaRU3-0002ss-51
	for qemu-trivial@nongnu.org; Tue, 13 Dec 2011 07:29:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41786)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1RaRU2-0002sm-Rc; Tue, 13 Dec 2011 07:29:23 -0500
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pBDCTLGR008729
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 13 Dec 2011 07:29:21 -0500
Received: from doriath (ovpn-113-83.phx2.redhat.com [10.3.113.83])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id pBDCTJ5t013196; Tue, 13 Dec 2011 07:29:19 -0500
Date: Tue, 13 Dec 2011 10:29:18 -0200
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Isaku Yamahata <yamahata@valinux.co.jp>
Message-ID: <20111213102918.1149c1f4@doriath>
In-Reply-To: <7649482739064866ddfb50275b1fcfa43547b782.1323747574.git.yamahata@valinux.co.jp>
References: <7649482739064866ddfb50275b1fcfa43547b782.1323747574.git.yamahata@valinux.co.jp>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] migration.h: remove incoming_expected
	declarations
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
X-List-Received-Date: Tue, 13 Dec 2011 12:29:30 -0000

On Tue, 13 Dec 2011 12:40:51 +0900
Isaku Yamahata <yamahata@valinux.co.jp> wrote:

> The variable is deleted by 1bcef683bf840a928d633755031ac572d5fdb851
> So remove its declaration.
> 
> Cc: Luiz Capitulino <lcapitulino@redhat.com>
> Signed-off-by: Isaku Yamahata <yamahata@valinux.co.jp>

Acked-by: Luiz Capitulino <lcapitulino@redhat.com>
> ---
>  migration.h |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
> 
> diff --git a/migration.h b/migration.h
> index 999d60f..372b066 100644
> --- a/migration.h
> +++ b/migration.h
> @@ -81,8 +81,6 @@ uint64_t ram_bytes_total(void);
>  int ram_save_live(Monitor *mon, QEMUFile *f, int stage, void *opaque);
>  int ram_load(QEMUFile *f, void *opaque, int version_id);
>  
> -extern int incoming_expected;
> -
>  /**
>   * @migrate_add_blocker - prevent migration from proceeding
>   *


