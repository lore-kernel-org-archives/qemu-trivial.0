Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bJST7-0006cL-9q
	for mharc-qemu-trivial@gnu.org; Sat, 02 Jul 2016 17:28:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50321)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1bJST2-0006Sp-9k
	for qemu-trivial@nongnu.org; Sat, 02 Jul 2016 17:28:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1bJSSz-0007Xf-Nr
	for qemu-trivial@nongnu.org; Sat, 02 Jul 2016 17:28:47 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:53058)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>)
	id 1bJSSt-0007SP-61; Sat, 02 Jul 2016 17:28:39 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue004) with ESMTPSA (Nemesis) id 0LkUgR-1brQZJ0W8R-00cTXw;
	Sat, 02 Jul 2016 23:28:22 +0200
To: Peter Maydell <peter.maydell@linaro.org>
References: <92770843-66C8-471B-BA9C-DA46E92817B9@akamai.com>
	<CAFEAcA9VxFBB7BYBWY1gtHeScPkPehoh6SMVY-68UGz6RSFS=g@mail.gmail.com>
	<164e58f5-7dcc-bc9f-286f-98b5de56c1cb@vivier.eu>
	<CAFEAcA9mk9Z=M+tahGE7JBiQ_zidqF1pj=13eLr0GcxHcSis3Q@mail.gmail.com>
	<cc5798cf-4e88-f1e7-f3ca-45482e0822bb@vivier.eu>
	<CAFEAcA976boeHjzyHMr_83cq+uezzBq=SCWePW-9780UAp=kHA@mail.gmail.com>
	<caf50e5d-791a-4ed2-0af1-54f96df35ae8@vivier.eu>
	<CAFEAcA_YBZGQmerK69pw_C=wX=CVKuPYUdD9EE7aRoH85CVXYw@mail.gmail.com>
Cc: "Wirth, Allan" <awirth@akamai.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Timothy Pearson <tpearson@raptorengineering.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <1ce00ab3-4c2f-aebc-a25b-339ae6e77d6f@vivier.eu>
Date: Sat, 2 Jul 2016 23:28:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_YBZGQmerK69pw_C=wX=CVKuPYUdD9EE7aRoH85CVXYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:T7EPSYPu/HOHUHfqm7MM1CBGIq+8HELguWlyT8hwhA6++5T6ZSL
	OnM3tWcpimcICXE9HSSU+K2Glpd0Ynr4bGKokpXB5Sq8iVhLru4/kyZ1NkDDPu5CE2k0/np
	KEP+wpBd06RIljX+ivXBUxFUHiP+abIvkFPvyAhEqC4k1yFawGtferyxublQfOnioVViVrO
	xM3G7N+83erWRcVTvjI7Q==
X-UI-Out-Filterresults: notjunk:1;V01:K0:Cgsh2sNcCsw=:mdPpMvhnu3lYiuazh51ucL
	pBX4V+qILQOteEev/bKunwmYA8If7HxCf8a20gwpKEDbFk9VmMOZCPu4zpQTYm9TIZ0Yvu/LQ
	vcGzKvh0NX+fzPRrcLuiD+TSxkgH78+sJ3VT1jWO5mvduRJmZLLpENW+3qAv7pyNgaDGRF2DG
	hUeCwe5KbqkNQ5Qhiu5BLF+KLz0hnuHb2Q0y/xW4uXu4GL0YBBbecHrstZAprDfMs+R1fGo0z
	mDhZ+VpBC00MQSN4M1uGqD8qJWp6WgiG/jUyWrzJZ84C3XI8NeF8Zwq1X829JE3jXJAW4Pxdq
	hWaV0Tv79rROhfWYTAnxJ+4RD701tQjBLcjKmz5I8pYtsajlGP1zyVHXm4N7FkxYEwl1OS583
	sVBufCvvYnzWV11otpsA5TF+wns+pNSDyQESPGuDFzp1Ohstt0AnzJ70d8JvrVTBKHJw7EZwx
	XadEVGQlMcMiKNFXlDowIltkCHJA3nWECXwMqSuKaEvPjb9EXpBQ8Jc84ej+4N9vGFhhLE34M
	aZdOZpcxXZkOhrxIdRk5UERR9rMpWzCHuKMeJ1auDRYLo3ds/E8MPNpcWDG6rmtA63gZWBFEM
	mE3GhFcpNluBOdPY42SD0FAKCBONBKsvlY4LIfG+Kvhnw/aJMqMg3/OlpEUnWA0GFKlgvvb44
	h/uqCJNiOEBVgmxmPbkGcB7y2hUPxb9H0/of4i0itLerxKgFARSmCfzxVaFrLbB9Z/qnLdiva
	33i2zhSWWV8Trw5N
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: fix signal()
 syscall on x86_64
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
X-List-Received-Date: Sat, 02 Jul 2016 21:28:51 -0000



Le 02/07/2016 à 23:20, Peter Maydell a écrit :
> On 2 July 2016 at 22:17, Laurent Vivier <laurent@vivier.eu> wrote:
>> Le 02/07/2016 à 22:12, Peter Maydell a écrit :
>>> (1) Define neither NR_select nor NR__newselect
>>>  (and use pselect6 syscall for select):
>>>  aarch64, openrisc, tilegx, unicore32, presumably any future arch
>>
>> They use:
>>
>> kernel/sys.c:
>>
>> #undef __SYSCALL
>> #define __SYSCALL(nr, call) [nr] = (call),
>>
>> void *sys_call_table[__NR_syscalls] = {
>> #include <asm/unistd.h>
>> };
>>
>> It's not very clear, but I think they use NR_select with sys_select:
>>
>> include/uapi/asm-generic/unistd.h
>>
>> #define __ARCH_WANT_SYS_SELECT
>> __SYSCALL(__NR_select, sys_select)
> 
> This is inside an #ifdef __ARCH_WANT_SYSCALL_DEPRECATED.
> Only arch/score defines that; most architectures using
> the asm-generic syscall numbers don't want these
> obsolete syscalls to exist.

I've missed that... so you're right on everything.

Thanks,
Laurent

