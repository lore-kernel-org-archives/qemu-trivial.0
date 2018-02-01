Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ehDOj-00018L-Fl
	for mharc-qemu-trivial@gnu.org; Thu, 01 Feb 2018 06:51:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1ehDOh-00016q-0p
	for qemu-trivial@nongnu.org; Thu, 01 Feb 2018 06:51:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1ehDOg-0005qg-3R
	for qemu-trivial@nongnu.org; Thu, 01 Feb 2018 06:51:19 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:45813)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1ehDOa-0005bv-SJ; Thu, 01 Feb 2018 06:51:13 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 6BE9C745723;
	Thu,  1 Feb 2018 12:51:04 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 53EEE7456FF; Thu,  1 Feb 2018 12:51:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id 52F357456D6;
	Thu,  1 Feb 2018 12:51:04 +0100 (CET)
Date: Thu, 1 Feb 2018 12:51:04 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Gibson <david@gibson.dropbear.id.au>
cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
In-Reply-To: <20180130194935.GL12900@umbus>
Message-ID: <alpine.BSF.2.21.1802011250090.39992@zero.eik.bme.hu>
References: <20180130131716.5899D7456D5@zero.eik.bme.hu>
	<20180130194935.GL12900@umbus>
User-Agent: Alpine 2.21 (BSF 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: Re: [Qemu-trivial] [PATCH] sii3112: Change angle brackets to quotes
 in #include lines
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
X-List-Received-Date: Thu, 01 Feb 2018 11:51:20 -0000

On Wed, 31 Jan 2018, David Gibson wrote:
> On Tue, Jan 30, 2018 at 02:10:10PM +0100, BALATON Zoltan wrote:
>> This matches what other files do for qemu includes
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>
> Applied, thanks.

Thanks but Markus instead included this in his cleanup patches here:
http://lists.nongnu.org/archive/html/qemu-devel/2018-02/msg00075.html
so you can drop this from your tree now.

Regards,
BALATON Zoltan

