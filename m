Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YdPy5-0002Lw-LX
	for mharc-qemu-trivial@gnu.org; Wed, 01 Apr 2015 17:14:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47541)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YdPy3-0002Lp-Gf
	for qemu-trivial@nongnu.org; Wed, 01 Apr 2015 17:14:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YdPy0-0005BK-OD
	for qemu-trivial@nongnu.org; Wed, 01 Apr 2015 17:14:31 -0400
Received: from mail-wg0-x229.google.com ([2a00:1450:400c:c00::229]:33323)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YdPy0-0005AS-IZ; Wed, 01 Apr 2015 17:14:28 -0400
Received: by wgoe14 with SMTP id e14so66404189wgo.0;
	Wed, 01 Apr 2015 14:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=elEqyaOqHsjtYPHhCpg931wUvgXlMzp8fsRwP2In+ls=;
	b=Q9fk6zJYl2LqaTac2oPfJKo1pLZ1GZJVexjlI9CBRzAR7TdRclyJi3sESY25wUtdkN
	KWaEqJ9gYlN7v+16bDblJDLKSVpJl4oJmwnZ3OHPZsUaISVMloI+CjUV3unyUwgnxBAU
	5WK1iOm2Y07C7BxW7U6IM4+D/IAqO+i2AKg4ztyzDS/fXbvPvzYHSFEB8oYHbp6ms4T4
	1Anr3NWvQznQO186nZ2jdjimF2DXgKyKR1R9d2ihi9+lRh0EhsT75s+Hthtr/pIpYvT9
	kpkT2Ttw5hMmA6vvOJ/CMDTX+ai3TpmJaPDsCCxL5hW38LvBehAEY0j3QogJqsrPiBF+
	BdWw==
X-Received: by 10.180.76.230 with SMTP id n6mr18663262wiw.15.1427922867880;
	Wed, 01 Apr 2015 14:14:27 -0700 (PDT)
Received: from [192.168.10.150] (net-93-66-123-41.cust.vodafonedsl.it.
	[93.66.123.41])
	by mx.google.com with ESMTPSA id r3sm4346123wjw.7.2015.04.01.14.14.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Apr 2015 14:14:26 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <551C5FAF.7010303@redhat.com>
Date: Wed, 01 Apr 2015 23:14:23 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: John Snow <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>, 
	qemu-devel@nongnu.org
References: <1427911244-22565-1-git-send-email-emaste@freebsd.org>
	<551C5DE7.70904@redhat.com>
In-Reply-To: <551C5DE7.70904@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::229
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qtest: Add assertion that required
 environment variable is set
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
X-List-Received-Date: Wed, 01 Apr 2015 21:14:32 -0000



On 01/04/2015 23:06, John Snow wrote:
> 
> if (qemu == NULL) {
>   fprintf(stderr, "...");
>   g_assert_not_reached();
> }
> 
> Though that does read a little strangely. ("Here's a nice error message
> for something we are asserting will never happen.")

Just "exit(1);" then.  :)

Good idea, this is annoying.

Paolo

