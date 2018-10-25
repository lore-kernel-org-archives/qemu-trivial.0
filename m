Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gFg9J-0008V8-CY
	for mharc-qemu-trivial@gnu.org; Thu, 25 Oct 2018 09:58:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39462)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gFg9H-0008Qn-Tl
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 09:58:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gFg9H-0008QF-9s
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 09:58:07 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:57015)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gFg9B-0008NY-1D; Thu, 25 Oct 2018 09:58:01 -0400
Received: from [10.101.215.124] ([185.7.230.216]) by mrelayeu.kundenserver.de
	(mreue012 [212.227.15.168]) with ESMTPSA (Nemesis) id
	1MfL5v-1feQJL0qeR-00gmzW; Thu, 25 Oct 2018 15:57:48 +0200
Received: from [10.101.215.124] ([185.7.230.216]) by mrelayeu.kundenserver.de
	(mreue012 [212.227.15.168]) with ESMTPSA (Nemesis) id
	1MfL5v-1feQJL0qeR-00gmzW; Thu, 25 Oct 2018 15:57:48 +0200
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>, Michael Tokarev <mjt@tls.msk.ru>,
	Max Reitz <mreitz@redhat.com>
References: <20181004161852.11673-1-crosa@redhat.com>
	<20181004161852.11673-4-crosa@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <1c3e1c63-8f4d-bb49-c736-0b943be0efc0@vivier.eu>
Date: Thu, 25 Oct 2018 14:57:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20181004161852.11673-4-crosa@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:UoOD/vY9iQP/OGZA2egfzfvQB9Y2BfWeffXZETegDDJ/CgucyUE
	wGr228pPikb78swNh1EFmQwL4FEc1IKDf9hGB+t2C7/W1yeDf8ce1ZWhl3VmAL5L9nlZof3
	yAVQtiNrs/fA66hNWLOyn7NV6R6a6n7EaEWgAGs90YfQz/oGbmmC7/jWhwWnBWLt/JUwQns
	PMJSl12pN6b9tzdgXcUIg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:qrvGb888UiY=:e2I1SxlMfBPRbAsprOzK9A
	PLgp4/N41Pt0ZVIxy+B0K2+DLZcGaNyi1qAnptqSkDK+54iraV08+Ro9Jm3veurYL+scU1YJ4
	ulNWmGClTRY5Wc0Goye6svmWwFMdrC3MvWB9a/Tyv4RZMmD7asPyoR1+LKXq6W1zM+OXGscjh
	JsfpaNSotcmFkF+DvTBe6sJTD0f3LBB9ztPt40lLWQPqo/sYik7tFKuseiwIbj+/eanYFTAYj
	PUdKGECoxflp7Fk8l0onjzIKgS0sKwwXtMeEqRs9Kciu0wkUAolKfH509br63zmHUH1zEub7s
	AledzYhCM1+pgja21j30vez2itaGi1OQUAv7TvcWzJwswUKfR6Mm/4q0Xr6xUydU2y5EYja19
	tMNOdEQlgmhExi7bqpO1VfwQcNnBLQB1ZZ33Xz2XDcRMbJzx3WsjbIR723wjoHkVJe9FDthp3
	1A9+PcyZn8TizPFTkpyVT9gS6n/XexoG6oWVJzeD/TENaWZuJEy5LRZ+1o9owqGYi8WZI0zrA
	YOBJAldESkb7ie5eQ6hhzYcoCsRepLqWLF+yrr9X79UgOm/zHA/pPyfMPMTXhdTqN1j+LrZLo
	4STvjQ8Pqz0YUasDr8F8cK8l2qpGdCCaEvR5o/9oJ6QEjRe+PO8ZH99p0XZ16bQpstzvUX9GI
	53MX5J4dkpQrxwR1X4XDBdom1isKdD6kZGGFyE/jbVjEYX+qvuilijtqPNcfPyXK4UXEf7hvk
	BN5X9yX/hGql4Vy8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: Re: [Qemu-trivial] [PATCH 03/10] qemu-iotests: make 218 executable
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
X-List-Received-Date: Thu, 25 Oct 2018 13:58:08 -0000

On 04/10/2018 17:18, Cleber Rosa wrote:
> Commit 990dc39c made all tests executable at the time, but 218 came in
> later, and missing those permissions.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/qemu-iotests/218 | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  mode change 100644 => 100755 tests/qemu-iotests/218
> 
> diff --git a/tests/qemu-iotests/218 b/tests/qemu-iotests/218
> old mode 100644
> new mode 100755
> 

Applied

Thanks,
Laurent

