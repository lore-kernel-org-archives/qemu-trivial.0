Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eEh95-0008JZ-LA
	for mharc-qemu-trivial@gnu.org; Tue, 14 Nov 2017 14:45:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51664)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eEh92-0008GF-TW
	for qemu-trivial@nongnu.org; Tue, 14 Nov 2017 14:45:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eEh8x-0005iI-Pq
	for qemu-trivial@nongnu.org; Tue, 14 Nov 2017 14:45:16 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:59664)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1eEh8x-0005ge-GB; Tue, 14 Nov 2017 14:45:11 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue006 [212.227.15.167]) with ESMTPSA (Nemesis) id
	0M2kBW-1f66TS1csY-00sbre; Tue, 14 Nov 2017 20:45:00 +0100
To: Zach Riggle <zachriggle@gmail.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>, 
	"open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20171024230758.31779-1-riggle@google.com>
	<20171025033442.44872-1-zachriggle@gmail.com>
	<fac44468-7869-57fa-fb5f-fbd98828489f@vivier.eu>
	<CAMP9c5m6GK_Xwt6z3Bj+1WauHzHffzFb1cVD9ojeh2m8gA-D8w@mail.gmail.com>
	<CAMP9c5kG9m-swMJBtdQPzPkjLy7zq9sEdRA-PGcdeFDAT-DH9w@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <b4ed3fcb-48a1-4304-9dab-1694e63eef3f@vivier.eu>
Date: Tue, 14 Nov 2017 20:44:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAMP9c5kG9m-swMJBtdQPzPkjLy7zq9sEdRA-PGcdeFDAT-DH9w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:YJlxJIRMNRz4/ngQ96iauTTSNPVi3UYvHZFBXFSyoMVRxUizrbf
	2Bvuv7dUwjgA1qjWggYCiNUw3iIhxTfTvA65Yy6NrHit6Maya6GcBVe6rEvtdCWk/05iKDy
	JI7LQpKr1sLYPChgQfaykLbdV3flGXA0xgtSkLDilVYz6+qMhN452wUGbt8Y2qPeWgbL5G8
	9DMMmhY6sKGl9jmqA34jg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:ac96HZpNeMY=:qYbbWZwVc4Rxpvll+sfjhH
	tBPc4GO20wQZqrhO61MHV1wAF4Njf4eYhxIfthMr8IAlSyf34j4FzlLE5SXTd2K/fC/1/RY0Q
	hJGFLq7G6R+fbljvyTGCHn67/mfWw41s5jJpYTunwWLZ0oV7oQXzk4mCeVHN83sOkNiOsPwr0
	lhbb7KWY5FhoOZfcflSTChBSN69aS0HW8bP5At/7t8MFWLC5/wxQZbyX3icup/NSAZrOXCWwz
	Feu6m4q5By1uQt1LVIhJSWDFLuH4tZ+NrQKH+bRnrgM9+w0vLnfAOisdldduy6COXIXSXOnH5
	QDzymDq+/bP13SaoWOvWlr0nsGZ3KKD3JwWbA91k+u/LCVVJ+MG2a3+LIYcaT4YUezCAjiMky
	oPuMou1Q+MhxTkDA72MCSV8lR3IKAD0iDyFR10IBPXASBWWwO5IUm4hN7V6O93gss9QqSy0R5
	kL4927spMtvqRE6MQZz+y+Iqxx9U91mNKH4zmafcz7AxWe4rIpAl4cUV3IuNglchVp+F6hwPr
	p58NA95ONfodbUyPNK8Z4lMI5LhDJBr6f2hyR/6IZzicWi7jP7jCAUXVmMwbCGPhJJDlIrT2P
	SH/hs+zijiJADvHCcMUM09mK1Kz0pWH+eCWGqe9EoNADqns35BqVFNNcSZIAaVMVhlOS11sY5
	fhtwH6j/oql+FJ+HBSycm/aAY2VpwD6KxNnPeA6Kd/i8RBir7+b7/wy58EYOAmfpanf3je3+0
	o2uHZT1wyHD0cfUU2mjpHR/GMB9CQRRgFTdyjMGk1Frmue8LEgs3R+iq6yo=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.135
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] linux-user: fix
 is_proc_myself to check the paths via realpath
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
X-List-Received-Date: Tue, 14 Nov 2017 19:45:17 -0000

Le 11/11/2017 à 02:48, Zach Riggle a écrit :
> I wrote up a quick example to show that this should work specifically for
> /proc/self/exe:
> 
> #define _GNU_SOURCE
> #include <sys/types.h>
> #include <sys/stat.h>
> #include <fcntl.h>
> #include <unistd.h>
> int main(int argc, char** argv) {
>     int fd = open("/proc/self/exe", O_NOFOLLOW | O_PATH);
>     system("ls -la /proc/$PPID/fd/");
> }
> 

And what about a readlink() in a loop until we cross "/proc/<pid>" (or not)?

Thanks,
Laurent

