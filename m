Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZYbDp-00049u-Ai
	for mharc-qemu-trivial@gnu.org; Sun, 06 Sep 2015 10:47:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59231)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ZYbDn-00049T-Uc
	for qemu-trivial@nongnu.org; Sun, 06 Sep 2015 10:47:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ZYbDk-0007dR-P2
	for qemu-trivial@nongnu.org; Sun, 06 Sep 2015 10:47:07 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:62969)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>)
	id 1ZYbDk-0007cv-EX; Sun, 06 Sep 2015 10:47:04 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue004) with ESMTPSA (Nemesis) id 0M1TKv-1YfxFC2UtF-00tTkn;
	Sun, 06 Sep 2015 16:41:31 +0200
To: Paolo Bonzini <pbonzini@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1438609948-3744-1-git-send-email-lvivier@redhat.com>
	<1438676851-10684-1-git-send-email-lvivier@redhat.com>
	<55EC1590.4000102@msgid.tls.msk.ru> <55EC4F3E.8070705@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <55EC5093.30707@vivier.eu>
Date: Sun, 6 Sep 2015 16:41:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <55EC4F3E.8070705@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:eeQBDQoNJMRZC7bYiJpH1LgwYt6Gj3is353xiykd7DCDrOkFWhR
	iqn7w6rOMoLk15TeJmk9I6IhFMoP62oQj2C/3TFOV8G5e38ePiqXVxEQA/UTaQfmMObgl3M
	zPUE9X5D6uH2JNunASko7YkjsGuPdyxJ8vM1SsbTo3dqG1Zfsn4T4isaboVXbWAHudLyzSi
	s6meRMgVSpIlrqvHQoRsA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:9bplarMwkNk=:dfEdGIMi7refPU/FBJAArs
	FDZ3dll7tM8UpKj+QDv2QVvb7CbXLp72e1zrydFEJQdFRayJP5vxECeFSpm+BxxBr1duwlvxi
	3A833oeTGg8M7iZ7mQZJYpvY3Ar/FCT9P9hAtk62NfDRHiW9uJoYOHpl+zxVHSBynZdwujr8Q
	L02PQOe81qfMUK50Kz6kStl0H4WU7wlRIMwMrYQixU645STJ5FfD3ASMbl3Frlkgy99HcYA4s
	v0/rFljBXGxJjfUEAuuCDBdujlUUnKoEDHIVUxA+g8PoketMlrJHch0VdXgeuBAnis9kKvHsg
	DobtwzIyq10PxinadLIjUV9seI+FQefkeJnILfZzfsywEFBMET8Jhg/+1az5Z3IR1NIoHsAG0
	tVoyp+zo5jDBHOSqGOABV5P0d9etHiQMTtUrCxaqzfVxj92T7OjjRf7xv+X5I0HhAh1Vvpu78
	oRGNsjkehkI7xsr7u/hc9/lH/rX9yUpY34ps8UAvXv5hMvj8TRhYOLRO09GQSZblNplHEWiv2
	+OGpVD8L0Os2QcSf21hHMCppE7xMqF8+Nwcg6NUFtoFbmOD3qRmL6pOMfdyAQLbqyDBU6Fjl8
	PXzdqt+eVFVCd4rT66k5SFn+NVGQtYgVkye2MUB2e8sSsT5hkI3if0iS7aOtAJii5zr4UfHBq
	ep5ru/zK6kyaIszggo7N4QDVLmlGxt/iG93mlkNLD/Stj6Dr2JFWydy8b9fAxwiyB3/tHIZeG
	+DQ3VfDf7NkulyXG
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Cc: "Richard W.M. Jones" <rjones@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH][TRIVIAL] i6300esb: fix
	timer overflow
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
X-List-Received-Date: Sun, 06 Sep 2015 14:47:08 -0000



Le 06/09/2015 16:35, Paolo Bonzini a écrit :
> 
> 
> On 06/09/2015 12:29, Michael Tokarev wrote:
>> 04.08.2015 11:27, Laurent Vivier wrote:
>>> We use muldiv64() to compute the time to wait:
>>>
>>>     timeout = muldiv64(get_ticks_per_sec(), timeout, 33000000);
>> ...
>>
>> Applied to -trivial, thank you!
> 
> I think this was superseded by a later patch.

Yes, but as the later has not already be taken, I prefer this one taken
and I'll update the other.

Laurent

