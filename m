Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WjS9a-0001SO-01
	for mharc-qemu-trivial@gnu.org; Sun, 11 May 2014 07:42:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55579)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WjS9S-0001JC-Kk
	for qemu-trivial@nongnu.org; Sun, 11 May 2014 07:42:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WjS9M-0004kK-Fy
	for qemu-trivial@nongnu.org; Sun, 11 May 2014 07:42:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38902)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WjS99-0004iY-RV; Sun, 11 May 2014 07:42:23 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 220B540DC0;
	Sun, 11 May 2014 15:42:23 +0400 (MSK)
Message-ID: <536F621F.1010008@msgid.tls.msk.ru>
Date: Sun, 11 May 2014 15:42:23 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Alon Levy <alevy@redhat.com>, qemu-devel@nongnu.org
References: <1399564447-19473-1-git-send-email-mjt@msgid.tls.msk.ru>
	<536F2EE0.10305@redhat.com>
In-Reply-To: <536F2EE0.10305@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] libcacard: g_malloc cleanups
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
X-List-Received-Date: Sun, 11 May 2014 11:42:48 -0000

11.05.2014 12:03, Alon Levy wrote:
[]
>> diff --git a/libcacard/cac.c b/libcacard/cac.c
>> index 74ef3e3..122129e 100644
>> --- a/libcacard/cac.c
>> +++ b/libcacard/cac.c
>> @@ -310,16 +310,11 @@ static VCardAppletPrivate *
>>  cac_new_pki_applet_private(const unsigned char *cert,
>>                             int cert_len, VCardKey *key)
>>  {
>> -    CACPKIAppletData *pki_applet_data = NULL;
>> -    VCardAppletPrivate *applet_private = NULL;
> 
> These two lines above (and the corresponding ones beloow) seem unrelated
> to this patch.
> 
>> -    applet_private = (VCardAppletPrivate *)g_malloc(sizeof(VCardAppletPrivate));
>> +    CACPKIAppletData *pki_applet_data;
>> +    VCardAppletPrivate *applet_private;
>>  
>> +    applet_private = g_new0(VCardAppletPrivate, 1);

Yes, that's removal of initial value setting of variables which
will be initialized on the next line.  It is like cleaning up
coding style (spacing around {} etc) in a nearby lines.  I can
mention this in the commit message, but I don't really think it
is really important.

Thanks,

/mjt

