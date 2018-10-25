Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gFmWD-0004M8-Ge
	for mharc-qemu-trivial@gnu.org; Thu, 25 Oct 2018 16:46:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gFmWA-0004Jl-SL
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 16:46:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gFmWA-0001pD-7g
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 16:46:10 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:57565)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gFmW2-0001hg-Lu; Thu, 25 Oct 2018 16:46:03 -0400
Received: from [10.43.15.91] ([94.185.135.34]) by mrelayeu.kundenserver.de
	(mreue106 [212.227.15.184]) with ESMTPSA (Nemesis) id
	1McHM2-1fk17y3G9s-00ciqJ; Thu, 25 Oct 2018 22:45:51 +0200
Received: from [10.43.15.91] ([94.185.135.34]) by mrelayeu.kundenserver.de
	(mreue106 [212.227.15.184]) with ESMTPSA (Nemesis) id
	1McHM2-1fk17y3G9s-00ciqJ; Thu, 25 Oct 2018 22:45:51 +0200
To: Li Qiang <liq3ea@gmail.com>
Cc: mst@redhat.com, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-trivial@nongnu.org, Qemu Developers <qemu-devel@nongnu.org>
References: <1539261534-2795-1-git-send-email-liq3ea@gmail.com>
	<9d750f50-3692-8376-6b04-34b1c3991b15@vivier.eu>
	<CAKXe6SKbUkfHtx8EFuq=8c97nxntOpO3WTESQr4X6ngciQ+9jw@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <153efab7-2002-97b7-5e13-8e5080674b82@vivier.eu>
Date: Thu, 25 Oct 2018 21:45:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAKXe6SKbUkfHtx8EFuq=8c97nxntOpO3WTESQr4X6ngciQ+9jw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:i7AO7z+M68oHIs68DZSn+m8aK1nKAWQ5agMH+63nrz2OD5578hs
	RIAW97STehspW9GiGsusguO2wpy20H9k00cUUSAzouPtn8oBl1A2dMNu2XvO5aLlnTTOqX9
	ys9AkIJw623LDzCLDNAhONzyHUL5o7lG/kllKTf8MdFGzbKAhPbFZ6KldlwkdHcW+5nNiA/
	YnX7+XvcpqPaswblZXYVw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:tzgt49W7b+E=:rwwrC4VO+COaoEYGp1Giwq
	cJO7pBgbmHaC5bTS5U1MdBcgxjJZezQa8sHQUvOLgdmHLLk3z51UTh8s9wfPBMCR3AaQBED8G
	vClPnvcBMY1K8PCU7PUmBk6Xflqo+4w6bEWNAHnJR/52tnBwplPwQe0r7JVZRsnXKo+fdIkI2
	EBtmR2w+u3c0nT0BJdV37TQpP3CsVQVcXpzrMmeDQacEutcwESrAU2il0Y41rdpe2Pf2Svz1R
	RtUx4aP7koyF6/688qf0bdHMckOAlO8SHRfOeytwNuPK5CP/5VFYNmb13F4X/AyASrtL8I1n0
	hKncqCy5b5bkdiOl2e/MI3hPxutdhp6yH3OFl1EBNko46zl4fRGcHo0XEiupU4hJEhrntvuVK
	aGT4iJsypM7I6DsELhBnCglmRJFq851VjADipA29+QCKoanBVJ5GfVZu9ImrZHCipX4fRq6wo
	i0wbT+SWFmpxwlDzRo6zts7R2+nz7y32rjaA5lZzDqETqKhzxwRSjITcpZeXKQbp4jjKUVZvj
	1oQiy/3BV5XcP68zLc2AdVh7jSwQbuMNoiqaD/GK6ROU6TWJg6PEWM6DfVokOy2OS5t62WMB7
	pZ+i/ck1sjQWEM3476a3klNO0G3fljEX1fdVO73mpNiT7Ft5LJW5T82hsGxiuNL7zk4+IgFJN
	ozr3r69M7O2O/MBM+uxL9tzzHdrmJIpEQIMCFHrcIFLFiK52s8oUZFjVq05x72QnKn6xk4U7f
	+WxOPql+iA9Rfa0E
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.73
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
X-List-Received-Date: Thu, 25 Oct 2018 20:46:11 -0000

On 25/10/2018 16:11, Li Qiang wrote:
> Hello Laurent,
> Thanks,
> 
> This patch has been in Michael's pull request.
> Maybe you can drop it.

Removed

Thanks,
Laurent

