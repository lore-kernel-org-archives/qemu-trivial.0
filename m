Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ecZfH-0007zM-Ux
	for mharc-qemu-trivial@gnu.org; Fri, 19 Jan 2018 11:37:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46718)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ecZfF-0007wh-7R
	for qemu-trivial@nongnu.org; Fri, 19 Jan 2018 11:37:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ecZfB-00082l-8V
	for qemu-trivial@nongnu.org; Fri, 19 Jan 2018 11:37:13 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:51181)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1ecZfA-00082V-UY; Fri, 19 Jan 2018 11:37:09 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue103 [212.227.15.183]) with ESMTPSA (Nemesis) id
	0LsNui-1ennys3I2y-011xLs; Fri, 19 Jan 2018 17:37:06 +0100
To: Marco A L Barbosa <malbarbo@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>, 
	QEMU Developers <qemu-devel@nongnu.org>
References: <20180111183714.22834-2-malbarbo@gmail.com>
	<CAFEAcA9Qo8uQ10FHP7XfuC+sgb4i8e_fxo7EvZGtVVWddqpxVA@mail.gmail.com>
	<CAHpsRN8rkMpcNmwwjpDFD3LDogZzCUqbitH-fHHWomc+GupLKw@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <1ad70940-1a7f-1645-ed9d-6556c404b36c@vivier.eu>
Date: Fri, 19 Jan 2018 17:37:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAHpsRN8rkMpcNmwwjpDFD3LDogZzCUqbitH-fHHWomc+GupLKw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:n0czJfzMrqnE0ZBxIZONYodDr6owgOzcfmAmOG2GxIHXpz10Lur
	MQV1N3RsvY+jw73FHl1Xv9AqdulaeS7hA4qs4ZDf+5CPo9hQyT0/cwRofIOweuiaiwVGDAq
	RzxeW+yyhX+W2BiSOFIRhvdC0+DT+cv2gIB0HwhM2di0h/v2JcrCjSEdXXRVmMv5/fgy3BG
	/kgYYkEEhX7tPJRt6k8OQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:g3UGF9eKmWA=:ibbM/IcxWt+u3xARsIewj8
	1M3CqnNlx8FC5jdvDxb05lqr1O0/wY+IWj91l4rZjAQYZUpKm+c1USH1uZeZ4NhviHulErt4u
	Gpg6ffMaxsdVIu3NxzhgxPMiUFbfqVwqSUPN+xFawLVtc/Xff1HkYLVj+LUcDTkXsukCEVG/Y
	O6z5bIkNr2fqeRqp8NM/A0PNhAkJHysKeQvycCS5rObLWSpgmQiGO9aL78RMrxED72t458e9k
	IFMtW9755gM6BPbWKv601J3Bh/yu2ytvIq03j6Mb1M+3sOwvI/AGrkZLPELdobDTpSeIrN5eA
	rqvLuAgGCEvitJ4BSBm8AUows7R3D7ZEiDL8iH6SE0+xl4I/o0aYeI0s+B9KAleBlJZGt/6e1
	knOqCIKyIRpK0YuT5lbTw3IEuD7e5pagills5315Gs6dzt6ktdr05zsQwPN18aq07e7KPYhbi
	z31P2GKqL/N0TyppFRKXkkaP4gtOHqKpIcA2THtucIHhvBOCQzrrmLZbGA1gkIlx6F9EtU00A
	C6mlotLif/TuaA6kEVP7MQlSQ1j88p3C+xFkBKJo/uSaTjHS3eTbtzPOg9Bt5JzkHbmSX58X9
	Exea+1lMUWRhaJwWuegPPMzgs2X9p121LF+s8fLcSMpT6COgtxH4hOqcS+PZtuRc5cNpqi22f
	1lxHpwOYeeElzTzkwhPjFUOu0sZ16/vUCAS7SbqhaUh8rdUenAAgcyyRJizACTCvBOHVEiZZ0
	q0XYRxdx4J7NJZtn6cQoFUO8/bK/EQObM5jZsMW4zJb18c/IrU0JyiVK5i8=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.17.24
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] linux-user: Add
 AT_SECURE auxval
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
X-List-Received-Date: Fri, 19 Jan 2018 16:37:14 -0000

Le 11/01/2018 à 19:56, Marco A L Barbosa a écrit :
> Thanks Peter,
> 
> Signed-off-by: Marco A L Barbosa <malbarbo@gmail.com>

With this S-o-b, applied to my linux-user branch.

Thanks,
Laurent


