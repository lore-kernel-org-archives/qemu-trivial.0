Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RXxgF-0005d4-I7
	for mharc-qemu-trivial@gnu.org; Tue, 06 Dec 2011 11:15:43 -0500
Received: from eggs.gnu.org ([140.186.70.92]:43856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RXxg7-0005JJ-IO
	for qemu-trivial@nongnu.org; Tue, 06 Dec 2011 11:15:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RXxg1-000325-1F
	for qemu-trivial@nongnu.org; Tue, 06 Dec 2011 11:15:35 -0500
Received: from mail-qy0-f173.google.com ([209.85.216.173]:55672)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1RXxfq-00030H-5A; Tue, 06 Dec 2011 11:15:18 -0500
Received: by qcsd15 with SMTP id d15so3148829qcs.4
	for <multiple recipients>; Tue, 06 Dec 2011 08:15:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.38.203 with SMTP id c11mr3200212qce.233.1323188117164;
	Tue, 06 Dec 2011 08:15:17 -0800 (PST)
Received: by 10.229.226.211 with HTTP; Tue, 6 Dec 2011 08:15:17 -0800 (PST)
In-Reply-To: <1321361232-38664-1-git-send-email-chenwj@iis.sinica.edu.tw>
References: <1321361232-38664-1-git-send-email-chenwj@iis.sinica.edu.tw>
Date: Tue, 6 Dec 2011 16:15:17 +0000
Message-ID: <CAFEAcA8LsZMouzv9zNUromfNP+ej++Zv9dGa1CT-HDgmnvVj_A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: =?UTF-8?B?Q2hlbiBXZWktUmVuICjpmbPpn4vku7sp?= <chenwj@iis.sinica.edu.tw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 0/6] Remove libqemu
 related stuff from QEMU source tree
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Dec 2011 16:15:40 -0000

On 15 November 2011 12:47, Chen Wei-Ren (=E9=99=B3=E9=9F=8B=E4=BB=BB) <chen=
wj@iis.sinica.edu.tw> wrote:
> From: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
>
> =C2=A0According to [1], libqemu is not available anymore. Remove libqemu
> related stuff from QEMU source tree.

Whole series:
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(and tested it still applies to current master.)

Can we call this a trivial patch? It's six patches, but they're all
individually pretty trivial...

-- PMM

