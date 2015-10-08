Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkiOL-0005BY-1l
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2015 20:52:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41352)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkESD-0000Uc-Jd
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 12:55:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkEPn-0005Jf-BN
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 12:54:05 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44634)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZkENc-0001vC-WD; Thu, 08 Oct 2015 12:49:21 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1E21D40A55;
	Thu,  8 Oct 2015 19:49:20 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id F34E6A83;
	Thu,  8 Oct 2015 19:49:19 +0300 (MSK)
Message-ID: <56169E8F.9060808@msgid.tls.msk.ru>
Date: Thu, 08 Oct 2015 19:49:19 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>, 
	"Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>, qemu-devel@nongnu.org
References: <1444043060-22835-1-git-send-email-dgilbert@redhat.com>
	<561299AE.1050703@redhat.com>
In-Reply-To: <561299AE.1050703@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, afaerber@suse.de
Subject: Re: [Qemu-trivial] [PATCH] tests: Unique test path for
	/string-visitor/output
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
X-List-Received-Date: Thu, 08 Oct 2015 16:55:11 -0000

05.10.2015 18:39, Eric Blake wrote:
> On 10/05/2015 05:04 AM, Dr. David Alan Gilbert (git) wrote:
>> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>>
>> Newer GLib's want unique test paths, and thus moan at dupes.
>> (Seen on Fedora 23 which has glib 2.46)
>>
>> Uniqueify the paths.
> 
> Not sure if "Uniquify" is any better spelling for a made-up word?

It looks like "Uniquify" actually is a word in use
(and I for one used it before myself).

Applied to -trivial, with the spelling fix from Eric :)

Thanks!

/mjt

