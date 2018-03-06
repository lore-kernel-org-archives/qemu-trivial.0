Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1etDO7-0008RS-JR
	for mharc-qemu-trivial@gnu.org; Tue, 06 Mar 2018 09:16:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60721)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1etDO2-0008Pm-B4
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 09:16:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1etDNy-0003jB-9D
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 09:16:14 -0500
Received: from chuckie.co.uk ([82.165.15.123]:42361
	helo=s16892447.onlinehome-server.info)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1etDNy-0003ie-1X; Tue, 06 Mar 2018 09:16:10 -0500
Received: from [86.188.254.49] (helo=[172.30.1.185])
	by s16892447.onlinehome-server.info with esmtpsa
	(TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1etDOA-0005lZ-1F; Tue, 06 Mar 2018 14:16:23 +0000
To: =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
References: <20180306134402.997-1-berrange@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <10097c87-9302-5de5-9b63-e76200989ac1@ilande.co.uk>
Date: Tue, 6 Mar 2018 14:16:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180306134402.997-1-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.188.254.49
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Sun, 08 Jan 2012 02:45:44 +0000)
X-SA-Exim-Scanned: Yes (on s16892447.onlinehome-server.info)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 82.165.15.123
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] misc,
 ide: remove use of HWADDR_PRIx in trace events
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
X-List-Received-Date: Tue, 06 Mar 2018 14:16:19 -0000

On 06/03/18 13:44, Daniel P. Berrangé wrote:

> The trace events all use a uint64_t data type, so should be using the
> corresponding PRIx64 format, not HWADDR_PRIx which is intended for use
> with the 'hwaddr' type.

Ha okay looks like you beat me to it ;)  I wonder if we can teach 
checkpatch.pl about this...


ATB,

Mark.

