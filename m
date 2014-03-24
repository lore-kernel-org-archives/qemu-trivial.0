Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WS5Eb-0008Db-HV
	for mharc-qemu-trivial@gnu.org; Mon, 24 Mar 2014 09:48:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33946)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1WS5ET-0006IU-Sd
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 09:48:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1WS4oz-0001Mx-9c
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 09:23:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33296)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1WS4oz-0001Ms-1b; Mon, 24 Mar 2014 09:21:45 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2ODKxgg011620
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Mar 2014 09:20:59 -0400
Received: from localhost (ovpn-112-70.ams2.redhat.com [10.36.112.70])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2ODK0db013105; Mon, 24 Mar 2014 09:20:00 -0400
Date: Mon, 24 Mar 2014 14:19:59 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20140324131959.GF4384@stefanha-thinkpad.redhat.com>
References: <1395566923-5074-1-git-send-email-prasadjoshi.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1395566923-5074-1-git-send-email-prasadjoshi.linux@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: alex@alex.org.uk, v.maffione@gmail.com, aik@ozlabs.ru,
	jan.kiszka@siemens.com,
	Prasad Joshi <prasadjoshi.linux@gmail.com>, riku.voipio@iki.fi,
	agraf@suse.de, qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	av1474@comtv.ru, kraxel@redhat.com, aliguori@amazon.com,
	pbonzini@redhat.com, g.lettieri@iet.unipi.it, rizzo@iet.unipi.it,
	afaerber@suse.de
Subject: Re: [Qemu-trivial] [PATCH 1/6] audio: set top level latch for each
	slot
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
X-List-Received-Date: Mon, 24 Mar 2014 13:48:12 -0000

On Sun, Mar 23, 2014 at 02:58:38PM +0530, Prasad Joshi wrote:
> CSMKeyControll function is supposed to set the top level latch for each
> slot. However, at the moment, it incorrectly updates only the first
> slot. Patch fixes the problem.
> 
> Signed-off-by: Prasad Joshi <prasadjoshi.linux@gmail.com>
> ---
>  hw/audio/fmopl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Peter: This series has some fixes for QEMU 2.0 since they are bug fixes.

> diff --git a/hw/audio/fmopl.c b/hw/audio/fmopl.c
> index 290a224..eb60c12 100644
> --- a/hw/audio/fmopl.c
> +++ b/hw/audio/fmopl.c
> @@ -725,7 +725,7 @@ INLINE void CSMKeyControll(OPL_CH *CH)
>  	OPL_KEYOFF(slot2);
>  	/* total level latch */
>  	slot1->TLL = slot1->TL + (CH->ksl_base>>slot1->ksl);
> -	slot1->TLL = slot1->TL + (CH->ksl_base>>slot1->ksl);
> +	slot2->TLL = slot2->TL + (CH->ksl_base>>slot2->ksl);
>  	/* key on */
>  	CH->op1_out[0] = CH->op1_out[1] = 0;
>  	OPL_KEYON(slot1);
> -- 
> 1.8.1.2
> 

