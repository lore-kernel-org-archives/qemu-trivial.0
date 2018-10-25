Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gFg4W-0002sa-Hh
	for mharc-qemu-trivial@gnu.org; Thu, 25 Oct 2018 09:53:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37423)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gFg4T-0002pi-3N
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 09:53:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gFg4S-00049x-D0
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 09:53:09 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:56391)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gFg4J-00041G-Ni; Thu, 25 Oct 2018 09:52:59 -0400
Received: from [10.101.215.124] ([185.7.230.216]) by mrelayeu.kundenserver.de
	(mreue011 [212.227.15.168]) with ESMTPSA (Nemesis) id
	1M9WiK-1gCOo51R2q-005bE4; Thu, 25 Oct 2018 15:52:53 +0200
Received: from [10.101.215.124] ([185.7.230.216]) by mrelayeu.kundenserver.de
	(mreue011 [212.227.15.168]) with ESMTPSA (Nemesis) id
	1M9WiK-1gCOo51R2q-005bE4; Thu, 25 Oct 2018 15:52:53 +0200
To: Li Qiang <liq3ea@gmail.com>, mst@redhat.com, marcel.apfelbaum@gmail.com
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <1539261534-2795-1-git-send-email-liq3ea@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <9d750f50-3692-8376-6b04-34b1c3991b15@vivier.eu>
Date: Thu, 25 Oct 2018 14:52:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1539261534-2795-1-git-send-email-liq3ea@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Y0X2ZTfEqJL263Ajd/kgxnYvOUIWKQjOZG8vDfs3lKsAPlXT0yt
	lzaaWxzlj4rRHUn33d8KQpXm5xbI/A52G91cxgFbHDnQpiLeofpVE71QAXXMKSZlA4OgjLy
	iZDLo7tKe9R0HCmGED2XwAo+XEbqpaBCsZn2bThwG0i5RLkSpLCWEWIeee/gWAommBTA4uk
	ql5J5kPYg6CbbYAtm5t6g==
X-UI-Out-Filterresults: notjunk:1;V01:K0:ArW75fSVx8w=:cSjxiqoHxMsH4F9k1qw/Id
	2sMlh628udzyWXV+sN9i9LX3FyxsyanIIz3BWPu4f+hwJyyhbf2kxUy/7ydyPxr9fLIcOA+Su
	3y9/+9vd0ZGm5AA2TVkglILXyeQxvkLQPxfPIt7zoVRdS6/vWFxnhcOrwWTtqtFpm0bYCTukj
	cP9ZXMiKVKv3IhQk9IQNgMEUm/4aYWGbyBK1Bnj5K8cuqzmzbfa3E1eTZC8M4gb5DThCzwyhs
	Jy2lGVaFmBwPHklm187UFEw8z9mtqzNxmo+5Vf/rcAmbpV7gNWfoeYH8JSUMa7m6BvCXnbwyv
	sgpc/589kxA7D7M90S0kcxspbzixsLI+Q5ufgfj2L6SMYNbODCWsvi471nlqxkQs7UQAxMOVl
	hAtS0u4KB4FK7urXcO5Q+mWarMCFSjaGd6I33VwPTV0Vq/xHljQxfTjFTIAw9OtKwcTOgxqRl
	LrUXv8KCKbzc1nTFCOi6wKoSs5P+g4zoMj9e191gDUJbmX6rZ+rc2eaJ7rG1D6jLMFXHSwWkZ
	a5W2ZOdTNFg2gRoUt1uEH7WE8hHBMgocmFvICD5UE2mPhd8NtxWyFf1Vy3E/ozFJ5WBTqT3iI
	ab6ZhnuOLPM4ddVGAyRcuHztnpwFui5fHWWNq0AJX/Unty2IU14KqNrF6Mo6aihPcVu4kssrK
	bzhEQgC3C+6wd94QdvAqiz6Vhml0GChzCIHYQyXjTa3JdGW1DYZ6RTK1H+Qb0UuhP3z7SoBVF
	aWleEK5RGtxG3h2c
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Subject: Re: [Qemu-trivial] [PATCH] piix: use TYPE_FOO constants than string
 constats
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
X-List-Received-Date: Thu, 25 Oct 2018 13:53:10 -0000

On 11/10/2018 13:38, Li Qiang wrote:
> Make them more QOMConventional.
> Cc:qemu-trivial@nongnu.org 
> 
> Signed-off-by: Li Qiang <liq3ea@gmail.com>
> ---
>  hw/pci-host/piix.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Applied,

Thanks,
Laurent

