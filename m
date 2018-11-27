Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRbun-0005yJ-Ua
	for mharc-qemu-trivial@gnu.org; Tue, 27 Nov 2018 06:52:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gRbum-0005wb-FZ
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 06:52:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gRbui-0008RN-HH
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 06:52:28 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:58901)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gRbug-0008Pa-EU; Tue, 27 Nov 2018 06:52:24 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MV6Bs-1g0gp72daY-00S7ko; Tue, 27 Nov 2018 12:52:15 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-22-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <769172b4-499c-c227-c36d-9394bd2df3bd@vivier.eu>
Date: Tue, 27 Nov 2018 12:52:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20181125205000.10324-22-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ip/cvlVlx+PRTyre2iLWf34sye7ZcElBSeM7RlVUYzC32fsYJG7
	Ch804SzT6dpJC0CO11CRamj7j07Vk7BWDKjVxRDdRKJPXFw9+XazJ3N1S10VnF5PhCAHFlm
	fEYd8mg0UbIavk09seCH7LtiLJaXvvAoXVv/mqJptliL00yICFhAiBrHThC2nRaWbhqIfWl
	lt4+SlP8k2DS/gSY7A+9Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3yDUi7pdMcA=:3msp1nUERn5tDhUxrjlJC9
	tk1tSBx7grcPydMwZNMrh+cwlbOvobgRQtgI6zg8/RZswsQr72rVL8U14aTRv2RNkN4i30kkH
	wdZG6rGgXBx71NyzNGshLNfhsq0UXweY9eWBB6PP8Rtq3uuekAf3H1jqy/32MqLz0wUWrflUf
	20Q0z3zzjPO4raICrSHU4/2uqC9yqOqdXhjjtfXMoFaC46dKJ1VNzB9GhJOCpOH8XlWQbhAMt
	k5Im5km9vPhfMEUkJ/5sszwB6jdKtEosL0uI+lZBwHj8CTRNNPy/+otG9o1LxOi7mjxXh2RMJ
	Dc04hnQOQl/CJeYfhEVn5d07UCwKgniako2KmSBgXm4t260twvaASpiUP5JBZEzfTGUwSjAak
	A2sM79+obtmPrDiScBUd/x9AJZacgks+tsHmmXiWbbsPv2hBPdTJ/NusyfBndAXIcTdMUW0r+
	ZPrvQ/tjbS6lKRHvzK21LYfqJvmSiIWxNEB78xTcVU7tfDCvEhInkW8bSqR8NBKlFi+kkVLC8
	mHz6B8LFGnQAlB4sD7w9nACLU4/umWbiixU9MtUwhuRrDxWCyK4nyIF34kG/wbQLXoWOlmPbh
	mnvzSP5vsJq4jNpk77dAqGj0m6Zl8hMYF9bktmfkh0pIOBV+r6fDgZ492wFeHPwkQ02ICDgNy
	tHXn+oQ3sLYmK7h6jff0RK4Ffq8PpIh3IR/g0uCICSQF1wupG/FuxpNgjb34/EkeHgz+hctND
	9idRXzGVnQ0w79C0/I5lD63JXFUBdlzK2bkDAy0OYZwP1ShVl7Kx1fsk5BVVWGhXh0Od3fFyk
	m1speeGaCsT2t0eaeHL5LXXsky8dtWG9+rvBXQdohqyLVn5I/5/DNBpM0Bb3LgGl8+ACi58e0
	gsRsEmEYGX0jTUvcAVdMYoPiqt3B5UuXRF1WMmJ5ZhmO+OKvaklNqo68DC0TEBJXUYha8ipTS
	DkOXhbvusKwq2HgasOX5aqjuUyCCcrQhkjCTXuhCvlAy5EshPiz4P6ANJI8KmHxO21EHMcr/v
	MQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: Re: [Qemu-trivial] [PATCH for-3.1 21/25] MAINTAINERS: Add a missing
 entry for the NVDIMM device
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
X-List-Received-Date: Tue, 27 Nov 2018 11:52:29 -0000

On 25/11/2018 21:49, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 26727c1561..92691589b1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1475,6 +1475,7 @@ S: Maintained
>  F: hw/acpi/nvdimm.c
>  F: hw/mem/nvdimm.c
>  F: include/hw/mem/nvdimm.h
> +F: docs/nvdimm.txt
>  
>  e1000x
>  M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

