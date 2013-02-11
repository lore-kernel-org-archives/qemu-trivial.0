Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U4tQB-0004NH-6k
	for mharc-qemu-trivial@gnu.org; Mon, 11 Feb 2013 08:27:47 -0500
Received: from eggs.gnu.org ([208.118.235.92]:58575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U4tQ8-0004Eo-0Q
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2013 08:27:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U4tQ2-0005tU-AS
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2013 08:27:43 -0500
Received: from mail-wg0-f52.google.com ([74.125.82.52]:46183)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1U4tPv-0005rf-9N; Mon, 11 Feb 2013 08:27:31 -0500
Received: by mail-wg0-f52.google.com with SMTP id 12so4759371wgh.7
	for <multiple recipients>; Mon, 11 Feb 2013 05:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=Jr+ILuRwLxPKC7W5gJTtziAv+RcMdA7pJM8T9ta39ig=;
	b=kJ6i4xNuXhvbiPCO1fWFUupJg8f9tDGpVtuU/4oe5M4XTqPFu/VmOHhdxhJ1O7wprS
	7tA5dCOZWtB6kDM+KstgvtW4QsOQCBGvNf08BC5fBeXM8lvovQ96ZE4YfGEvgFHxdcju
	GG1cfOqrCKSXRswyXKaPrbadYEiFX+Ip/4YD7WFzARgmjGwTFZ3p1dL+q0oOQt2IFd5Y
	y3HjBT/ZDv/mKjkNNK/q/Um2bJ56MZY1obnMYLV0687+teotO8uxy0g8f81OewLniFhE
	bHF9vbzK6k26NHx3QH7lvOtDiFB90SK2zFs5QBT2VdAii2xAE4PXzjg8pP8RmM1fvU/B
	DQOg==
X-Received: by 10.194.171.198 with SMTP id aw6mr23890466wjc.3.1360589250240;
	Mon, 11 Feb 2013 05:27:30 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id bf2sm21858036wib.6.2013.02.11.05.27.28
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 05:27:29 -0800 (PST)
Date: Mon, 11 Feb 2013 14:27:27 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>
Message-ID: <20130211132727.GC6491@stefanha-thinkpad.redhat.com>
References: <1360534332-6549-1-git-send-email-hpoussin@reactos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1360534332-6549-1-git-send-email-hpoussin@reactos.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.82.52
Cc: Kevin Wolf <kwolf@redhat.com>, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, Blue Swirl <blauwirbel@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ide: log error when trying
 to use ATAPI overlapping features
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
X-List-Received-Date: Mon, 11 Feb 2013 13:27:45 -0000

On Sun, Feb 10, 2013 at 11:12:11PM +0100, Hervé Poussineau wrote:
> 
> Signed-off-by: Hervé Poussineau <hpoussin@reactos.org>
> ---
>  hw/ide/core.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/ide/core.c b/hw/ide/core.c
> index 3743dc3..f0ab1a8 100644
> --- a/hw/ide/core.c
> +++ b/hw/ide/core.c
> @@ -1394,8 +1394,10 @@ void ide_exec_cmd(IDEBus *bus, uint32_t val)
>          break;
>      case WIN_PACKETCMD:
>          /* overlapping commands not supported */
> -        if (s->feature & 0x02)
> +        if (s->feature & 0x02) {
> +            qemu_log_mask(LOG_UNIMP, "ide: overlapping command not supported");

qemu_log_*() isn't used much in hw/.

I think we need to side-track this patch email to figure out what to
use:

fprintf(stderr) - some warnings/errors use this
error_report() - goes to the monitor, if possible, otherwise stderr
qemu_log_*() - goes to the qemu log, seems a little TCG-centric

Thoughts?

Stefan

