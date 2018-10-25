Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gFg4A-0002PQ-1v
	for mharc-qemu-trivial@gnu.org; Thu, 25 Oct 2018 09:52:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37272)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gFg47-0002LZ-Kb
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 09:52:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gFg42-0003qH-Fs
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 09:52:47 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:57379)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gFg3k-0003cd-Ll; Thu, 25 Oct 2018 09:52:25 -0400
Received: from [10.101.215.124] ([185.7.230.216]) by mrelayeu.kundenserver.de
	(mreue001 [212.227.15.168]) with ESMTPSA (Nemesis) id
	0Ltifl-1fYL2n2WEH-011Bmi; Thu, 25 Oct 2018 15:52:04 +0200
Received: from [10.101.215.124] ([185.7.230.216]) by mrelayeu.kundenserver.de
	(mreue001 [212.227.15.168]) with ESMTPSA (Nemesis) id
	0Ltifl-1fYL2n2WEH-011Bmi; Thu, 25 Oct 2018 15:52:04 +0200
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	yuchenlin@synology.com, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com
References: <20181022080053.9379-1-yuchenlin@synology.com>
	<adce4765-3ff4-0898-168d-7d55606720f4@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <e6f9d70f-4e18-6bf7-9f61-1f0f56742162@vivier.eu>
Date: Thu, 25 Oct 2018 14:52:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <adce4765-3ff4-0898-168d-7d55606720f4@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hBtc35eCU4tn3m8cS8Y/x5O4HiBlVC6Dy+ItOpKxoDy7tJ3bjVd
	VnAtVzIwePjYs04zrBDp+CQOAA/8gLWM+72lpTX7B6M5USsC5z4Zq/7jw+JZK7yya+8w91A
	sF8uYvSGJt89r00JmdVxaP5Nzcocc1kqvJBrdEIH5shPVnKhhMjg3wCGQoYiuM+MCXj0wCV
	jBBkw1IMZTXEvpoPn6FOw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:tQt+61IUw/E=:PIUEdeF8O3I2D9A9LY2c6R
	fXmLkSrDCkOa3z7awUCXa8E5zHGsyxadmW1yNyam3RhVGVPF90luaSSWIwJf888DpTm0aZpu4
	j22s0yhPBofhLG/G0wQdXCGoNCLzZo1s2KeObDijOqToqaBGyhGuC9PM3ZeTzGMJqm+1OKRSY
	xhtaKiB6kNq4rvpAmp4dW1wueX6RPxB5XlDlEe+HVC8mOqziudlfp6WeV+FEpTJlNp9SAm/Gf
	wiqiqaPFlaOMO0sKHfNcZC13IYQ5DLER5Mmq29tHaB+zwAwHBz5BJd1uRaB5q8AGPulBbjDQE
	bieEidG2/igi1jOsUYMfPcK5EhLWbqs5gj3Xn4jhoZqIpBsJ0NfwMl+8gJATvIzCYMvVIP6hW
	F1GTFsIkH54Jbd2zRo+HcaOLAbDsGOkivicdSiFDKicaOLQzkyB134LU1DWKTm/OE+gAhvUzU
	jiNPiCyJC6atvYKvJrGcWrsrJ0iGA8Ghr+ZDPGEkuiwghNvAr/gV6E916yWB2KN4czBjYc7bM
	/W4u4EhKR5BQQ5pPTKqmJH++4v7Hm+ZEmsOniAyv2gynSmULgNyFrTvrZmhJksEkb13EMzKzs
	EN19V9Wxxmk061JFB7WGw3USHUcedWzY4n0Vggt5sPPwHZTwbuVWuPadFn6f4X0GorWi4x2cY
	eSZ76qyxOa22RuWMNqNq87tija/62gqCXCOkX82qDaB7wMwFgP+h2gWbIUoxt71IMqNLssk0i
	+oJYzJH8v+tSlmid
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vga_int: remove unused
 function protype
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
X-List-Received-Date: Thu, 25 Oct 2018 13:52:49 -0000

On 23/10/2018 00:45, Philippe Mathieu-Daudé wrote:
> On 22/10/18 10:00, yuchenlin--- via Qemu-devel wrote:
>> From: yuchenlin <yuchenlin@synology.com>
>>
>> Signed-off-by: yuchenlin <yuchenlin@synology.com>
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 

Applied,

Thanks,
Laurent

