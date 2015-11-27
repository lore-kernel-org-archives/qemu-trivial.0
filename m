Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a2KD7-0007xA-Gl
	for mharc-qemu-trivial@gnu.org; Fri, 27 Nov 2015 09:41:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1a2KD4-0007u0-Vp
	for qemu-trivial@nongnu.org; Fri, 27 Nov 2015 09:41:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1a2KD1-0005Yc-8f
	for qemu-trivial@nongnu.org; Fri, 27 Nov 2015 09:41:14 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57851)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1a2KCv-0005WK-Bt; Fri, 27 Nov 2015 09:41:05 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id D8F63383AD7;
	Fri, 27 Nov 2015 14:41:04 +0000 (UTC)
Received: from [10.36.112.19] (ovpn-112-19.ams2.redhat.com [10.36.112.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAREf16s000545
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 27 Nov 2015 09:41:03 -0500
To: Markus Armbruster <armbru@redhat.com>
References: <1448626105-29540-1-git-send-email-pbonzini@redhat.com>
	<87oaefzeuh.fsf@blackfin.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56586B7D.2040205@redhat.com>
Date: Fri, 27 Nov 2015 15:41:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <87oaefzeuh.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.5] bt: fix two struct
	sizes
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
X-List-Received-Date: Fri, 27 Nov 2015 14:41:15 -0000



On 27/11/2015 15:39, Markus Armbruster wrote:
> Since you also fix RESET_FAILED_CONTACT_COUNTER_RP_SIZE, I assume you
> checked them all.
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

No, I just copied the upstream bluez patch.

Paolo

