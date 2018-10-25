Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gFgC3-0002UO-U9
	for mharc-qemu-trivial@gnu.org; Thu, 25 Oct 2018 10:00:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gFgC1-0002Sl-MA
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 10:00:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gFgBw-0002C7-Fb
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 10:00:57 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:49949)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gFgBw-00027I-1l; Thu, 25 Oct 2018 10:00:52 -0400
Received: from [10.101.215.124] ([185.7.230.216]) by mrelayeu.kundenserver.de
	(mreue010 [212.227.15.168]) with ESMTPSA (Nemesis) id
	1M4K6z-1gFPCi0Qq1-000LY1; Thu, 25 Oct 2018 16:00:33 +0200
Received: from [10.101.215.124] ([185.7.230.216]) by mrelayeu.kundenserver.de
	(mreue010 [212.227.15.168]) with ESMTPSA (Nemesis) id
	1M4K6z-1gFPCi0Qq1-000LY1; Thu, 25 Oct 2018 16:00:33 +0200
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>, Michael Tokarev <mjt@tls.msk.ru>,
	Max Reitz <mreitz@redhat.com>
References: <20181004161852.11673-1-crosa@redhat.com>
	<20181004161852.11673-11-crosa@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <a49bbe8f-7c63-a7c7-64e1-01f9842a76ef@vivier.eu>
Date: Thu, 25 Oct 2018 15:00:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20181004161852.11673-11-crosa@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:ZWcV4fnvvAcDJJynlcxrt6Y9S+x96eERNXs2/N6X4gn4S0HMK05
	gZXx1XT8u/HUbl/NAmCaDMA9rViFWPA9vFP08m0crgfIVd618iY/0EetmnrFq07HOH10N31
	unkita1t47RQSj2T1oXPKWPwRrvgIWiK4L9wMVw+EqhhRvnF1KpNHn9OJuIzg0u0zfGYalq
	rDGa07nHQNPuRPSbwNA7w==
X-UI-Out-Filterresults: notjunk:1;V01:K0:xZ605NeAzHw=:K1+c7lE9toIPozzBKrMjzw
	805CTM+20WEPhcMKS7e3OfDfkxDW33PZzFdpE0K7xRIrrOxLD7FXBqf8NJZ3Dc/immI33yuln
	k1oHoZnTOQO8Ry9RMCB5Mg5Pb+ae6oLdE/sKIocU2TcFMt07ojH8Y36gxW5IZUPXb3I7lGCH0
	4qkMIzf6NnQUvPXxRjNPRkQJ0XiXR0tX14NqceWNChZKYpfceInI8UQdPaj2g229wbXaMlb5x
	vb1wBcjWqHEoAQ/xoaPK4tqO/iclQiQvxPmpX2MmqOCaZtHGZG1v9S8ni4YAn3+T8upeioxq3
	chqOCGeImbkkYnUlDfKkIDAmsvwOGNXV+mTahbjHEjE1J3zZ8Vi7GXXmj+9I4vUOU2w2dMRxW
	KB3ndaXn1/t4L5cbbS2r40gIcZ51M6PmAKdIeAVxvQeDXMN6pZ8JNJlG/99GH1fK7sxjvdCJi
	YUNU3w6BeMpuAIrb5PnMgD07r/OMraRW+pdfyMhfeOXjiDe9HrCMMYWmzi0WF+HT2WpDCYtgi
	2B2BpRHArZA7IWfOZOQVJsiwz0rnebVGZu1UOrw+1ZTOXuF2pkd2N0fac+AtV7TMrmRZyXfkm
	POWi6kgLU5QshvGezP3/mkOCiSo60NoB+6k+QjK38Jx06B8EqJfgN2aIq9OQs2quTYtd7HqAB
	zCAwtvLBUjeToCvL2FzqPTulehb37Ftkpt2Fdo2duHaIeu437nYy8nrk1zoxZkyBtnn9t5gv0
	ZBpIqnvhaUIIcqoI
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
Subject: Re: [Qemu-trivial] [PATCH 10/10] scripts/qemu.py: remove trailing
 quotes on docstring
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
X-List-Received-Date: Thu, 25 Oct 2018 14:00:58 -0000

On 04/10/2018 17:18, Cleber Rosa wrote:
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  scripts/qemu.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/qemu.py b/scripts/qemu.py
> index 7abe26de69..676eb9709a 100644
> --- a/scripts/qemu.py
> +++ b/scripts/qemu.py
> @@ -88,7 +88,7 @@ class QEMUMachine(object):
>          @param name: prefix for socket and log file names (default: qemu-PID)
>          @param test_dir: where to create socket and log file
>          @param monitor_address: address for QMP monitor
> -        @param socket_scm_helper: helper program, required for send_fd_scm()"
> +        @param socket_scm_helper: helper program, required for send_fd_scm()
>          @note: Qemu process is not started until launch() is used.
>          '''
>          if args is None:
> 

Applied

Thanks,
Laurent

