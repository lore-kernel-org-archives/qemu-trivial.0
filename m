Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqlWw-00044y-Ix
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2019 16:11:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45507)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1gqlWu-000411-8N
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 16:11:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1gqlWp-0001KR-Ax
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 16:11:45 -0500
Received: from iserv.reactos.org ([2a01:4f8:1c17:5ae1::1]:59714)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <hpoussin@reactos.org>)
	id 1gqlWX-0000wn-Uy; Mon, 04 Feb 2019 16:11:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=reactos.org
	; s=25047;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
	Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=9OFDEGwZqF6Ew2lbuZStrNV13K5eJhJtMJ3IAB3CvnY=;
	b=ILm7aPO3iPeoIKn8fZ1xeOkDb/
	YnbmiPYbyY+92EoiJFIDVf3W4hZrmq5MXn11NdRxVCU7OxZE59UEk20DKVAiTznI+6KC0hAtU6Z/c
	7b8vQ51Z5rnwu++XYo6f36aaOXQCUdjQ/2seQrFPxgzWxXXHNhnYf1BSEqySzghxGzXA=; 
Received: from rob92-5-82-227-227-196.fbx.proxad.net ([82.227.227.196]
	helo=[192.168.0.35]) by iserv.reactos.org with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
	(envelope-from <hpoussin@reactos.org>)
	id 1gqlWI-0005AP-EU; Mon, 04 Feb 2019 21:11:10 +0000
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: qemu-ppc@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, David Gibson
	<david@gibson.dropbear.id.au>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20190204210433.26088-1-philmd@redhat.com>
	<20190204210433.26088-4-philmd@redhat.com>
From: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
Message-ID: <38f72fdf-2260-e886-7d60-0fd169545255@reactos.org>
Date: Mon, 4 Feb 2019 22:11:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190204210433.26088-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a01:4f8:1c17:5ae1::1
Subject: Re: [Qemu-trivial] [PATCH 3/3] hw/ppc/prep: Drop useless inclusion
 of "hw/i386/pc.h"
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Feb 2019 21:11:49 -0000

Le 04/02/2019 à 22:04, Philippe Mathieu-Daudé a écrit :
> In 47973a2dbf we split the last generic chipset out of the PC
> board, but forgot to remove the include of "hw/i386/pc.h".
> Since it is now unused, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>

