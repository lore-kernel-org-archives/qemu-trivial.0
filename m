Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRbtu-0005KE-Bb
	for mharc-qemu-trivial@gnu.org; Tue, 27 Nov 2018 06:51:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gRbts-0005Jc-7c
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 06:51:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gRbto-00087u-9C
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 06:51:32 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:34925)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gRbtm-00086n-Aj; Tue, 27 Nov 2018 06:51:28 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1M9Frd-1gMOZ51VqB-006NV4; Tue, 27 Nov 2018 12:51:20 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-20-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <0c4192f0-36b0-0870-3f33-502d5418bef1@vivier.eu>
Date: Tue, 27 Nov 2018 12:51:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20181125205000.10324-20-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hy1R1AA0HnvnAfnjgnasPdpgGnpU7WWCQUbDz1dsfagqhnapAWi
	U/Ng6ifo01ErgJweeulofo0GRSWHgP4UAq61CDVpZggMQm6XIzCWjf7MLUD5sbJlxCiP+IB
	d0Ibrq9UGeAbd2XdmOtDi8m8HtqUotsfGS/Jg5cy6k/q04jrgn4rRO9PvZ/VZM5NaKDoXTj
	gJ7GlkZVS9Rl46gOFz3nA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PeUYtkrOWJ8=:OsDrujqhP71fmz0U4bkv3G
	2UMj/l3Rtz9bV6+Vml+xiE7hSRN8tBd+d1+g/E855k33E2Wrm+gufXRyPPjxOqGCmB8dOxjgw
	plZtQQQX1pvq5xDuirRn3Q9JFmW65XQVa4C9gdeQ3IA2uU3///w7hl8oLpDSVDT/16Ic/DGS8
	z3RPcOrsyw8XrOl80uVDkpjg6xWDWBHdUZBOFpL1NhgYXiN8KHJ1TFV1gT3NgsXcazbipt+Md
	xzJgZiioiWK645XIjrqoK2TUKNY3gn07KUSt9Z7nqBTirpvlXuJYumdi50hPKo48h6s81UUhj
	uLvLPA5H/ePpFQSnnkn6VnxEdflgPLteLlEUu8J/HDPrV8HQSF2KxNzkMbgbh1tJd95EziqJs
	MPm2mxJJ/I4DXAcBGy5UYdUhiiqajriTg421nZWNObOjK2p0I7ODNXzDbGV57BLcRjWLRT2hY
	Rrp9W3ktdVW7w1iLJjZN5ZJI3dxHA8bqmen3/pjn1nlIxSiZPDEBWi3PHZEc0AcNQNKH3/RBq
	Ghulntad4cNxofvVweGwXavng0yV9Zaqp2Qs5uE7Q4dUuGigEMNqVt7X6CR/qZTw0QWyjeF1t
	uq9hac5AFwsCkg40xZcBqDZe0oC/waCS3S2ycc1acBpTg/ombd5Y4rn7BAsC3IcjwSWMGDQyc
	mla77uc2oNWQFCTk2lupSuL+tuKkwsCogd19fsUb1sCZTALmmfjYBEI5NExBp14eZ6r96Q+ke
	Q7gcF0LE8+yROMvRWX5QKG/hfPtB4t+7JLoHRqbRgwd93tKpi/UPG6j/RPWjYyTt4oL8dwVS6
	mxG7jdHULdJmhncva8D5l9qDCBtqNjbADH3qA7KuueAYb7lUaR4veW1PLAkmK9wxw3/F1XYer
	JuOwXw91vat3VJMsyOoNxbcbE+07qJqk+qGm0Sx5TBiaT2bWVnLczS/hkZ/ziYG3EakgQiVo7
	ARifftX8quXxvtBwuEXVtRULRm5X6AZ48QXXbTT0dqN4lRg3zHKfa12KWI+FxE0SOxmpFc76O
	Cw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
Subject: Re: [Qemu-trivial] [PATCH for-3.1 19/25] MAINTAINERS: Add a missing
 entry to the QMP section
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
X-List-Received-Date: Tue, 27 Nov 2018 11:51:34 -0000

On 25/11/2018 21:49, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ac5d25491f..c73dde10a5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1887,6 +1887,7 @@ S: Supported
>  F: qmp.c
>  F: monitor.c
>  F: docs/devel/*qmp-*
> +F: docs/interop/*qmp-*
>  F: scripts/qmp/
>  F: tests/qmp-test.c
>  F: tests/qmp-cmd-test.c
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

