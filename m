Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YG9Eq-0005mF-FY
	for mharc-qemu-trivial@gnu.org; Tue, 27 Jan 2015 11:43:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42022)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YG9Ek-0005lK-CJ
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 11:43:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YG9Eg-0003jb-Mn
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 11:43:34 -0500
Received: from mail-wg0-x234.google.com ([2a00:1450:400c:c00::234]:63266)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YG9Eg-0003jR-FX; Tue, 27 Jan 2015 11:43:30 -0500
Received: by mail-wg0-f52.google.com with SMTP id y19so15788770wgg.11;
	Tue, 27 Jan 2015 08:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=J99vA0vgEK2Woj3LV1YNxn5tFxkRV/sVBX6HPFQpGyE=;
	b=OCQT0miIi5aRKcMFziCcpGuhsUld2x4UEp9NMBgWC7ALstZ+c2+Ir79DkwhGa0LFyL
	14NSelUBva/z+55g87EKrkcZG79H6rPVIObmbCw3wimvQPkVqAVzqYF2YRh3rTYSWPls
	dubgJ2CKvcuAQRpEp8PiCe8rAMKQVL6Ath3xqxpctsNMnIJwwCyX7SsoCRUO42ISREnX
	13lE3odShvI8MDhMKnB3U7G3SvFCiB1TZ4LnmI8M8yVqAgSV494rth4N+sRR+iA7T1KV
	aN0wgMwHglo/SJqCKDRI+NXLMWkjvkH8FeEijTcINbpPBAEszB7zPBLo8RECoJ9HGRuw
	fG4g==
X-Received: by 10.180.98.228 with SMTP id el4mr18415488wib.77.1422377009684;
	Tue, 27 Jan 2015 08:43:29 -0800 (PST)
Received: from [192.168.10.165] (net-2-35-193-154.cust.vodafonedsl.it.
	[2.35.193.154])
	by mx.google.com with ESMTPSA id x10sm2863819wif.15.2015.01.27.08.43.27
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jan 2015 08:43:28 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <54C7C02E.40701@redhat.com>
Date: Tue, 27 Jan 2015 17:43:26 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1422375232-29283-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1422375232-29283-1-git-send-email-armbru@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::234
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/3] util/uri: Cleanups and a bug fix
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
X-List-Received-Date: Tue, 27 Jan 2015 16:43:39 -0000



On 27/01/2015 17:13, Markus Armbruster wrote:
> Note: checkpatch is unhappy with the first patch, because I refrained
> from cleaning up the ugly return(NULL).  They're all over the place.
> 
> Markus Armbruster (3):
>   util/uri: uri_new() can't fail, drop dead error handling
>   util/uri: realloc2n() can't fail, drop dead error handling
>   util/uri: URI member path can be null, compare more carfully
> 
>  util/uri.c | 61 +++++++++++++------------------------------------------------
>  1 file changed, 13 insertions(+), 48 deletions(-)
> 

Patches 1-2 okay.  For patch 3 a very similar patch was posted yesterday.

Paolo

