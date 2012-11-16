Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TZMNh-0003Ij-Ts
	for mharc-qemu-trivial@gnu.org; Fri, 16 Nov 2012 08:54:53 -0500
Received: from eggs.gnu.org ([208.118.235.92]:55744)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1TZMNd-00034w-O1
	for qemu-trivial@nongnu.org; Fri, 16 Nov 2012 08:54:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1TZMNa-00046f-LV
	for qemu-trivial@nongnu.org; Fri, 16 Nov 2012 08:54:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36291)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1TZMNU-00045F-8e; Fri, 16 Nov 2012 08:54:40 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qAGDsaJH009793
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 16 Nov 2012 08:54:36 -0500
Received: from rincewind.home.kraxel.org (ovpn-116-63.ams2.redhat.com
	[10.36.116.63])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qAGDsYjB021566; Fri, 16 Nov 2012 08:54:35 -0500
Message-ID: <50A64599.6040502@redhat.com>
Date: Fri, 16 Nov 2012 14:54:33 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.10) Gecko/20121026 Thunderbird/10.0.10
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <20121111221650.GA3575@foober.ini.cmu.edu>
	<50A0CECA.9060102@redhat.com>
	<20121112144918.GA2107@hedwig.ini.cmu.edu>
	<20121116135024.GB31927@stefanha-thinkpad.redhat.com>
In-Reply-To: <20121116135024.GB31927@stefanha-thinkpad.redhat.com>
X-Enigmail-Version: 1.4
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, jbaron@redhat.com, somlo@cmu.edu,
	qemu-devel@nongnu.org, "Gabriel L. Somlo" <gsomlo@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ehci: fix compile error
 with EHCI_DEBUG enabled
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
X-List-Received-Date: Fri, 16 Nov 2012 13:54:53 -0000

On 11/16/12 14:50, Stefan Hajnoczi wrote:
> On Mon, Nov 12, 2012 at 09:49:19AM -0500, Gabriel L. Somlo wrote:
>> Turning EHCI_DEBUG on gave me compile errors. This is my best guess
>> as to what the DPRINTF arguments *should* be, hope I guessed right :)
> 
> In that case I'll let Gerd confirm whether or not the guesses are
> correct.

Already fixed in master.

cheers,
  Gerd


