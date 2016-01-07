Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aH7UC-0004Tu-62
	for mharc-qemu-trivial@gnu.org; Thu, 07 Jan 2016 05:08:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45613)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1aH7U9-0004R5-QV
	for qemu-trivial@nongnu.org; Thu, 07 Jan 2016 05:08:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1aH7U8-0000NI-UI
	for qemu-trivial@nongnu.org; Thu, 07 Jan 2016 05:08:01 -0500
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:38298)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1aH7U8-0000N6-Nv; Thu, 07 Jan 2016 05:08:00 -0500
Received: by mail-wm0-x232.google.com with SMTP id b14so114925056wmb.1;
	Thu, 07 Jan 2016 02:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=RtCGD09XKtHP+fN6AQfnjeChFEY2Y2rEuSG1ijGqUiA=;
	b=xZdUlSn5v5O0PWJsd3iq0wwmnpIS1J7PNHD6DmZbEybKb0OGmp3oiwDqI7MipKcy+Z
	Eb4lHIAyl8XEX/ywN76G0fX2kupCwdvLZVs5l7X0xQdzuO+l+xMC2ctlw9pP5K+qOlVI
	vKMX2R5m6CMmtTUn/Enkh1I9Uqemth6bmohImQuzLr0BdxFJpd9M3tiUDAGkwm1Bbmq1
	n/kUi7nuZ6qJLy/KFR2gX/sQrNMaV/j4yFbFiwzl9N9iysfEvHtOzpxVXaQgFoXR2HsS
	nlO0iBdgmTcPEubg9g1HZAoHaegPzChFEOk7bkYH7s8m9cdyc5DdWvUiegxwDZCiYTBm
	4m5w==
X-Received: by 10.194.173.233 with SMTP id bn9mr112634859wjc.1.1452161280206; 
	Thu, 07 Jan 2016 02:08:00 -0800 (PST)
Received: from [192.168.10.150] (94-39-185-77.adsl-ull.clienti.tiscali.it.
	[94.39.185.77]) by smtp.googlemail.com with ESMTPSA id
	67sm12888384wmp.20.2016.01.07.02.07.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jan 2016 02:07:59 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Cao jin <caoj.fnst@cn.fujitsu.com>
References: <1452073066-28319-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<20160106132255-mutt-send-email-mst@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <568E38F8.2090109@redhat.com>
Date: Thu, 7 Jan 2016 11:07:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20160106132255-mutt-send-email-mst@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::232
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
	hare@suse.de
Subject: Re: [Qemu-trivial] [PATCH] SCSI device: fix to incomplete QOMify
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
X-List-Received-Date: Thu, 07 Jan 2016 10:08:02 -0000



On 06/01/2016 12:23, Michael S. Tsirkin wrote:
> Acked-by: Michael S. Tsirkin <mst@redhat.com>

Queued, thanks Cao and mst!

Paolo

