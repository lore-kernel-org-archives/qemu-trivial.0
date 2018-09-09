Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fyuzS-00039b-7d
	for mharc-qemu-trivial@gnu.org; Sun, 09 Sep 2018 04:22:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1fyuzQ-00039S-Ag
	for qemu-trivial@nongnu.org; Sun, 09 Sep 2018 04:22:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1fyuzN-0008Uf-5i
	for qemu-trivial@nongnu.org; Sun, 09 Sep 2018 04:22:40 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:46585)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1fyuzM-0008TH-Ri; Sun, 09 Sep 2018 04:22:37 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue004 [212.227.15.167]) with ESMTPSA (Nemesis) id
	0M9cEd-1g9fy90X6t-00D2J3; Sun, 09 Sep 2018 10:22:26 +0200
To: Tony Garnock-Jones <tony.garnock-jones@glasgow.ac.uk>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	qemu-stable@nongnu.org
References: <20180908182205.GB409@mornington.dcs.gla.ac.uk>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <f7076ae9-da04-7dbc-8acf-ebe5b948c4ed@vivier.eu>
Date: Sun, 9 Sep 2018 10:22:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180908182205.GB409@mornington.dcs.gla.ac.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Y1m5vXm4tFAKVHF4WKifLSbpAYclUeRj0w+MUqCsgPUI2m9zfRR
	9VM24r0T9uIBXTGTZezUInUmnb8MOU3sQ3bKVooUQVT+vVBgXYuQAxz/8TS2XyT+fDag3Ms
	eVNater4IQprx7IsEUj9BP+nxFCz2TNA4RI/tFUMtZTqxpiSvj4cl7SEhRSXZYvC8cV25aU
	tnqSzs3BpSc59//zpeiFA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:f18C/mXzFfY=:JASx4g81aZpDq1JS5y8SpI
	y57M/Y3sOS8U2OS12RXBgD/ZUCPwzkAYtbOepowcj7c4aZQpZymXwaiX1vw+s1o9un3ni5jVx
	8BQ+U9Zd+3/iEZ0sPU5m9VH/iClq7340Bl1SXNskQjpGuwma5tArSyuU3A66V2Pa3rbPAgF6N
	KV7evQhLrJbY5a3AODo6uCsd6GZURH1wz1FFvneVKob//u6oZGu9/cuI0352z5RA71zZnnSwh
	welNleLfVWyFgFlPmT5n97hygSN16NMddKK1NQVhskzQr7H/3c35U6iqgszXhEEsTdPEFYjYj
	qEMjKRoYzmZe06Ly9md1BkQ3fnC13YyKENwHtKveBmrBiuEJzHhrWqaUbvsK+PnvbDKXsLqHz
	tGm3bBXwhnMsXTy//oixInnvvu1hRtakZ6fYUZKkblWyJkzcsFq1KzD/3xKACrPKehjcgyxrT
	8Tmr55wvWyhOVfm3+ktiC8FDrcUoFrbf/ArF398nXLuXc6rWrRpH6ihAVQwqig2rIE42zXv7A
	0G+KvrV90UGYXJqSW/itAj5scgRTp938aEi3gevG2nCj0mwO1LBAMRSGGyYGMB9Un444mDtax
	hfrD67ho/23dnBmkEGsOhhq6aTzkKsF0nCBnLZ1oYAyxv+dXzD95WOZH4qATOid6scr9pX8f0
	Ofy8Nc/QLAwyfOhG9gA4k9K6Kq7IOGwM988KHipCLhhJSr0nbos/S3ImLoiUEMA1F81KZeWJX
	4wCr6PBNtYNXI6J9
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: write(fd, NULL,
 0) parity with linux's treatment of same
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
X-List-Received-Date: Sun, 09 Sep 2018 08:22:41 -0000

Le 08/09/2018 à 20:22, Tony Garnock-Jones a écrit :
> Bring linux-user write(2) handling into line with linux for the case
> of a 0-byte write with a NULL buffer. Based on a patch originally
> written by Zhuowei Zhang.
> 
> Addresses https://bugs.launchpad.net/qemu/+bug/1716292.
> 
> From Zhuowei Zhang's patch (https://lists.gnu.org/archive/html/qemu-devel/2017-09/msg08073.html):
> 
>     Linux returns success for the special case of calling write with a
>     zero-length NULL buffer: compiling and running
> 
>     int main() {
>        ssize_t ret = write(STDOUT_FILENO, NULL, 0);
>        fprintf(stderr, "write returned %ld\n", ret);
>        return 0;
>     }
> 
>     gives "write returned 0" when run directly, but "write returned
>     -1" in QEMU.
> 
>     This commit checks for this situation and returns success if
>     found.
> 
> Subsequent discussion raised the following questions (and my answers):
> 
>  - Q. Should TARGET_NR_read pass through to safe_read in this
>       situation too?
>    A. I'm wary of changing unrelated code to the specific problem I'm
>       addressing. TARGET_NR_read is already consistent with Linux for
>       this case.
> 
>  - Q. Do pread64/pwrite64 need to be changed similarly?
>    A. Experiment suggests not: both linux and linux-user yield -1 for
>       NULL 0-length reads/writes.
> 
> Signed-off-by: Tony Garnock-Jones <tonygarnockjones@gmail.com>
> ---
>  linux-user/syscall.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Laurent Vivier <laurent@vivier.eu>



