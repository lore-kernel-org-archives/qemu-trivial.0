Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UCT5z-0005VM-2m
	for mharc-qemu-trivial@gnu.org; Mon, 04 Mar 2013 05:58:15 -0500
Received: from eggs.gnu.org ([208.118.235.92]:53166)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UCT5w-0005Qc-1l
	for qemu-trivial@nongnu.org; Mon, 04 Mar 2013 05:58:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UCT5u-0003lh-Kr
	for qemu-trivial@nongnu.org; Mon, 04 Mar 2013 05:58:11 -0500
Received: from mail-bk0-f46.google.com ([209.85.214.46]:56148)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UCT5o-0003kW-Ef; Mon, 04 Mar 2013 05:58:04 -0500
Received: by mail-bk0-f46.google.com with SMTP id j5so2348584bkw.19
	for <multiple recipients>; Mon, 04 Mar 2013 02:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=FKyYNDaCmsB4TSVY+2+Bozkn9pN+7aSeSmp3SGZxjDM=;
	b=0ennuhSqgBfNDlMOJ2aJ5ZhBtoCzHlQiQHVXi1VOVi0+MPPDLqo6mxlCVtskOAt2h8
	hK1RLLAlO7MUxaCCeaAamPFKly0ioMF4/dNq9S5lc3L+uOH5mObViKVUtBwHJT60kEyg
	kRK20nDNJnOHo5k1iz9aXRUpfv+j4bDyDYbrDDbl54GjcPoOjYlwj0F2bRorkVq3wDNR
	tl2/7N9TGIGwJXkbKm4bptiM5loNOcRMDYWQ7WQo/LjU1KCo0ZSrQTeBSCmAiyYrisD3
	aVGuF+jhy0kWptY+2XdWwsPGU5psHeSzx6j82Wi+imDvgAmpsvRS3UCCZqEv4wpejmf5
	uUag==
X-Received: by 10.205.136.205 with SMTP id il13mr7064367bkc.93.1362394683382; 
	Mon, 04 Mar 2013 02:58:03 -0800 (PST)
Received: from localhost ([2a02:810d:e80:64:69de:8c87:ab42:42b3])
	by mx.google.com with ESMTPS id k4sm5589616bkv.18.2013.03.04.02.58.01
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 04 Mar 2013 02:58:02 -0800 (PST)
Date: Mon, 4 Mar 2013 11:58:00 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20130304105800.GD2837@stefanha-thinkpad.redhat.com>
References: <1362157061-438-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1362157061-438-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.214.46
Cc: qemu-trivial@nongnu.org, patches@linaro.org, qemu-devel@nongnu.org,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] pci_host: Drop write-only address_space
 field
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
X-List-Received-Date: Mon, 04 Mar 2013 10:58:13 -0000

On Fri, Mar 01, 2013 at 04:57:41PM +0000, Peter Maydell wrote:
> The address_space field of PCIHostState was only ever written, never used.
> Drop it completely.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Noticed this when looking at converting versatile_pci to be a subclass
> of pci_host; it's nice to be able to drop the ugly fishing around in
> the object struct that the two users here were doing...
> 
>  hw/pci/pci_host.h |    1 -
>  hw/piix_pci.c     |    1 -
>  hw/ppc/prep.c     |    1 -
>  3 files changed, 3 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

