Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TimkG-00078c-2s
	for mharc-qemu-trivial@gnu.org; Wed, 12 Dec 2012 08:53:08 -0500
Received: from eggs.gnu.org ([208.118.235.92]:59826)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Timk9-00077E-Iz
	for qemu-trivial@nongnu.org; Wed, 12 Dec 2012 08:53:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Timk3-0004yc-LP
	for qemu-trivial@nongnu.org; Wed, 12 Dec 2012 08:53:01 -0500
Received: from mail-ie0-f179.google.com ([209.85.223.179]:60495)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Timk3-0004yX-F2; Wed, 12 Dec 2012 08:52:55 -0500
Received: by mail-ie0-f179.google.com with SMTP id k14so1811438iea.10
	for <multiple recipients>; Wed, 12 Dec 2012 05:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=yyaUB9G5MHAObfxlMG7xmUql911xwAtGSHJwdhjvQfg=;
	b=F7YdLbVTCVDH+DULiqHfcpnYE9QVupf0oSMN1QNmKo+DO93LjLC+r4GamcGNqpu19F
	K0nTLq+12KWvrLDBz+skq4G4sOxtvMj7GxXHJSFDIy8Pr/l0IouBcpjnQiGf/ipF/LtU
	HFM13ZCa3lu6/NYvXstUkH3z1MuEugGJdgIbNya01kCanP0B3L7KcUfotfoFaf6pxrkZ
	eBSdDQl1c0nShN5vmWKxu2rZIic6lu+GqBbF8rqMSUU41ubc0jKfKdL+70R6l/PsUsz+
	xiVRAV90MSnrTjhEZMyMKc+YBHvWAB4Lku4fhBrXQ0KZaCd86fjYy2qcVde3nUu1xZwu
	J1xA==
Received: by 10.50.56.139 with SMTP id a11mr13280277igq.3.1355320374785;
	Wed, 12 Dec 2012 05:52:54 -0800 (PST)
Received: from yakj.usersys.redhat.com (93-34-219-150.ip51.fastwebnet.it.
	[93.34.219.150])
	by mx.google.com with ESMTPS id bg10sm1823074igc.6.2012.12.12.05.52.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Dec 2012 05:52:53 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <50C88C2B.2010901@redhat.com>
Date: Wed, 12 Dec 2012 14:52:43 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
References: <1349868762-10021-1-git-send-email-pbonzini@redhat.com>
	<50759EEC.8070308@weilnetz.de> <50759F9E.3060800@redhat.com>
	<5075A0FF.3080904@weilnetz.de> <5075A420.10003@redhat.com>
	<5075A843.8020107@weilnetz.de> <5075A966.3090708@weilnetz.de>
	<871uh5tqr7.fsf@explorer.in.ibm.com> <5076BACC.7030309@redhat.com>
	<87y5hdejes.fsf@linux.vnet.ibm.com>
	<87obi8ew14.fsf@linux.vnet.ibm.com> <50BF4015.2050102@redhat.com>
In-Reply-To: <50BF4015.2050102@redhat.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.223.179
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	"M. Mohan Kumar" <mohan@in.ibm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] virtfs-proxy-helper: check return code
	of setfsgid/setfsuid
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
X-List-Received-Date: Wed, 12 Dec 2012 13:53:07 -0000

Il 05/12/2012 13:37, Paolo Bonzini ha scritto:
>> > I have tested the below patch. Currently i don't have a signed-off-by on
>> > the patch. One change noted by mohan which I incorporated in the patch
>> > is we need to call setresgid before calling setresuid. If you are ok
>> > with this change I can send it upstream.
> Yes, please.
> 
> Either your version without pointers or mine is okay for me.

Ping?

Paolo

