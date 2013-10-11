Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VUiwL-0006zg-MZ
	for mharc-qemu-trivial@gnu.org; Fri, 11 Oct 2013 16:04:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dkoch@verizon.com>) id 1VUiwC-0006x7-Sb
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 16:03:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dkoch@verizon.com>) id 1VUiw6-0005sq-RA
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 16:03:52 -0400
Received: from fldsmtpe03.verizon.com ([140.108.26.142]:51516)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dkoch@verizon.com>)
	id 1VUiw6-0005sg-NC; Fri, 11 Oct 2013 16:03:46 -0400
X-IronPort-Anti-Spam-Filtered: false
Received: from unknown (HELO fldsmtpi03.verizon.com) ([166.68.71.145])
	by fldsmtpe03.verizon.com with ESMTP; 11 Oct 2013 20:03:44 +0000
From: Don Koch <dkoch@verizon.com>
X-IronPort-AV: E=Sophos;i="4.93,1082,1378857600"; d="scan'208";a="568149575"
Received: from unknown (HELO MIA20725CAS892.apps.tmrk.corp) ([162.47.0.51])
	by fldsmtpi03.verizon.com with ESMTP; 11 Oct 2013 20:03:43 +0000
Received: from yoyo.cloudswitch.com (10.25.25.113) by
	MIA20725CAS892.apps.tmrk.corp (10.1.3.224) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Fri, 11 Oct 2013 16:03:16 -0400
Message-ID: <52585983.1000606@terremark.com>
Date: Fri, 11 Oct 2013 16:03:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1381520073-32674-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1381520073-32674-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 140.108.26.142
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial <qemu-trivial@nongnu.org>,
	qemu-devel <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Stefan Hajnoczi <stefanha@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] misc: Spelling and
	grammar fixes in comments
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
X-List-Received-Date: Fri, 11 Oct 2013 20:04:00 -0000

On 10/11/2013 03:34 PM, Stefan Weil wrote:
> * it's -> its
> * grammar fix in ui/vnc-enc-zywrle.h
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> This is v3 of http://patchwork.ozlabs.org/patch/257416/.
> 
> v3:
> Don't try to improve a strange sentence in the same context ("Of cause [...]").
> 
>  qapi-schema.json    |    2 +-
>  slirp/if.c          |    2 +-
>  ui/vnc-enc-zywrle.h |    2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/qapi-schema.json b/qapi-schema.json
> index 60f3fd1..a003aa1 100644
> --- a/qapi-schema.json
> +++ b/qapi-schema.json
> @@ -1914,7 +1914,7 @@
>  #
>  # Since: 0.14.0
>  #
> -# Notes: This command only exists as a stop-gap.  It's use is highly
> +# Notes: This command only exists as a stop-gap.  Its use is highly
>  #        discouraged.  The semantics of this command are not guaranteed.
>  #
>  #        Known limitations:
> diff --git a/slirp/if.c b/slirp/if.c
> index 87ca8a5..fb7acf8 100644
> --- a/slirp/if.c
> +++ b/slirp/if.c
> @@ -142,7 +142,7 @@ diddit:
>  
>  /*
>   * Send a packet
> - * We choose a packet based on it's position in the output queues;
> + * We choose a packet based on its position in the output queues;
>   * If there are packets on the fastq, they are sent FIFO, before
>   * everything else.  Otherwise we choose the first packet from the
>   * batchq and send it.  the next packet chosen will be from the session
> diff --git a/ui/vnc-enc-zywrle.h b/ui/vnc-enc-zywrle.h
> index 1ff40b1..d436d58 100644
> --- a/ui/vnc-enc-zywrle.h
> +++ b/ui/vnc-enc-zywrle.h
> @@ -305,7 +305,7 @@ static inline void harr(int8_t *px0, int8_t *px1)
>     |L1H0H1H0|L1H0H1H0|L1H0H1H0|L1H0H1H0| : level 1
>  
>   In this method, H/L and X0/X1 is always same position.
> - This lead us to more speed and less memory.
> + This leads us to more speed and less memory.
>   Of cause, the result of both method is quite same
>   because it's only difference that coefficient position.
>  */
> 

Since you're in the neighborhood, this paragraph needs more fixes:

 In this method, H/L and X0/X1 is always in the same position.
 This leads us to more speed and less memory.
 Of course, the result of both methods is the same
 because the only difference is the coefficient position.

Thanks,
-d




