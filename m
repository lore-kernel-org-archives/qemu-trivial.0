Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goTEf-0001mz-UN
	for mharc-qemu-trivial@gnu.org; Tue, 29 Jan 2019 08:15:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56923)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1goTEa-0001l9-Su
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 08:15:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1goTEY-0001uO-T3
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 08:15:24 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:50885)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1goTEP-0001g2-1E; Tue, 29 Jan 2019 08:15:13 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1MvavG-1h7nHW2vaw-00se56; Tue, 29 Jan 2019 14:14:04 +0100
To: Thomas Huth <thuth@redhat.com>, Liam Merwick <liam.merwick@oracle.com>,
	qemu-devel@nongnu.org
Cc: QEMU Trivial <qemu-trivial@nongnu.org>
References: <1548327184-13416-1-git-send-email-thuth@redhat.com>
	<4aa7084c-3134-ec7b-a3ac-556a5ba9a7b7@oracle.com>
	<8766ee08-9bba-cad3-d3a9-fc0468f61b82@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <095ef44d-7fc3-246d-4af2-d71c9f097949@vivier.eu>
Date: Tue, 29 Jan 2019 14:14:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <8766ee08-9bba-cad3-d3a9-fc0468f61b82@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:d9xATrGkLlwlKmcw8BlNCrni2wl42bwBCWPuY2tpLbMLS5yrIVs
	URiv/eIxeTohgp9wr4Soi9oXu+HeyE467UkPaGnX/Uh6t2nnWvNKvJL1QES/2/Zzl1ThMsm
	665mdWvYeddU/x0t3a/78vH3iQ3CqxqL6UFbuAZ6okJQIltD42rJKNeQ5x3fdFGGxlfGbuk
	uzF4y9gkv/ZXjCIwz0OLw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7Ub+fPYwmP8=:UlOBLd4DLqGNsVb5o86uhw
	Dj9YCzgueiX3ajDFvbSMj7B3gnGk2Rko+TDmOrElGV5MDbJpSX9/x4N91B0jqVQmKExcAFPxD
	qR414bWOnIAfRkWBAXnxpWrvMdse3YPY9dDx1LSPByj0QGUb8KOm/4KmNVQF63Cr2+pzR4Myq
	8VAFSyxLlrx965hz0opNKoqnCuoMgGLX4MkDYs+HlTXrLIyAy/fjhK7QZHAWhQf7TRTch4pF+
	ZdYvnmh0klzTt6nPs8vmV1oGQ/WDzy6TUiKPE1ohH4oAnvXx4ubN3O1HKfOxWffZ8MtmYF8aT
	NxdnJzevzrTaBARjhCuNOnlq+NCSsMBov+aTTImGMyX5Awsz1ZblAt+jpCNRJR4OMdSWO1Ne9
	t/yHd51K4RvjGYN0jY7MJ6UCk2wRzcs+Gam6abecKyZ6xgzBmjS3ji2v6lQFnr9dNG69PCjDu
	8x9SaAMhM/Gm+RcTEjBCLcXIDR6rmInyVEsmCMqwxXyQ/PrKImobcjqQs3Xz/YJpsHOkLrQK+
	318mTWadPSDnHLvQLezorzsJtckTMvGEamnNsrn06yWPY3ydngjMDqZZxqNcPkDqjelN56e0s
	Dj/blkQ4xMY8f2GNBKS9wAlNFzQorAdxfdyWia8Glj8eIAhFjUpWz7Ez0VAWwT/Xxh1Bb7tst
	VQvm1qJx8cU0rKELSN5MFeV8H8kDFxhqLKGd+8Xtat+4Qgm4+1Xw412cfGEX0q/13LyIiyzR0
	eEkVMissV9VVhpEKdqNv9hp00/BSo4aNbp3pYghICVvfSWEC+fEvWqQUcno=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target/m68k: Fix LGPL
 information in the file headers
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
X-List-Received-Date: Tue, 29 Jan 2019 13:15:29 -0000

On 29/01/2019 14:03, Thomas Huth wrote:
> On 2019-01-29 13:51, Liam Merwick wrote:
>> On 24/01/2019 10:53, Thomas Huth wrote:
>>> It's either "GNU *Library* General Public version 2" or "GNU Lesser
>>> General Public version *2.1*", but there was no "version 2.0" of the
>>
>> Should the word "License" be after both instances of "Public" above ?
>>
>>> "Lesser" library. So assume that version 2.1 is meant here.
>>
>> '"Lesser" library.' -> '"Lesser" license.' ?
> 
> Right, thanks a lot for noticing!
> 
> Laurent, could you please fix this when you pick this patch up? Or shall
> I send a v2?
>

Send a v2, please. So I'll be sure it will be properly written.

Thanks,
Laurent


