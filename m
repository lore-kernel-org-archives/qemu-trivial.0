Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fs389-0008UB-BS
	for mharc-qemu-trivial@gnu.org; Tue, 21 Aug 2018 05:39:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fs386-0008TL-P0
	for qemu-trivial@nongnu.org; Tue, 21 Aug 2018 05:39:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fs381-0002OY-Kx
	for qemu-trivial@nongnu.org; Tue, 21 Aug 2018 05:39:14 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:54362)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1fs381-0002NG-CJ
	for qemu-trivial@nongnu.org; Tue, 21 Aug 2018 05:39:09 -0400
Received: by mail-wm0-f65.google.com with SMTP id c14-v6so2263841wmb.4
	for <qemu-trivial@nongnu.org>; Tue, 21 Aug 2018 02:39:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Z1IIuyXPSpj048mXdlue9VLKjN4DEti4fs+fQcLvON4=;
	b=hx5It8oR7hl/V1xKPcbSx5S1ALd36hbwwARYRtFlDnVrgOkpaY2RDuHe4ag+XkdZGk
	sNkH14iB+CPoicmemYTybIG7c/e0IorLcnoi9axTNbhjOBoLUzxtXPjNHkWdWKPBvpvL
	P6WnaDJQ4bAbrNgbzdy0lOod2kMmOZIuhgyL0+iXvbaqv6MTWc3Q42cw6bf43Lqe4qG7
	Z3P7p9rnj4cs2BkouC4gDT4eCxpzNMhqtABik17yfX4E8k8RxuQUxdPrOyoZYmFIh7Q/
	6ITRVGJA4EfkeYZv/CaGGCf/SBgvtcOs9txwS+fRsRDmnaZSBH1lZ6Sl8Wut6Ud+Z4f8
	xWow==
X-Gm-Message-State: APzg51CtcFWIXHvnAhLNm/LzovF/vQlGTA+AxLG5vMCT4pnlxol/YtuH
	qNsV4tIgT4lyb7S5o3y0/BAK4w==
X-Google-Smtp-Source: ANB0VdYsF6F2qtJ1vVd70INeotdXoz5LxT4Jpp0WL9hmDaDD5tPnUVnuD8SFIjbsK6E7uV3KmH/D/A==
X-Received: by 2002:a1c:1f50:: with SMTP id
	f77-v6mr1446177wmf.52.1534844347574; 
	Tue, 21 Aug 2018 02:39:07 -0700 (PDT)
Received: from [192.168.10.150] (dynamic-adsl-78-12-184-244.clienti.tiscali.it.
	[78.12.184.244]) by smtp.gmail.com with ESMTPSA id
	b10-v6sm9284622wrr.88.2018.08.21.02.39.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Aug 2018 02:39:06 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
	Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<f4bug@amsat.org>, Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Howard Spoelstra <hsp.cat7@gmail.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20180818025653.21192-1-f4bug@amsat.org>
	<66dfe354-9c2c-8642-a905-03155555fe99@redhat.com>
	<a812530c-ad1b-f5ff-6e15-82227cb76c79@redhat.com>
	<2fd04596-a8a0-889f-239d-92853c12c6aa@redhat.com>
	<2d91d7e2-938d-dbbe-5a11-edf48d4e0fc8@redhat.com>
	<eca82595-47c6-a195-8224-6a9f6619decd@redhat.com>
	<e7a5018b-a480-4a5d-d305-cd69a007a452@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d941c0c3-1ac6-442d-3b43-370ec1d9b00c@redhat.com>
Date: Tue, 21 Aug 2018 11:39:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <e7a5018b-a480-4a5d-d305-cd69a007a452@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.65
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] migration: Replace
 strncpy() by g_strlcpy()
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
X-List-Received-Date: Tue, 21 Aug 2018 09:39:15 -0000

On 21/08/2018 08:03, Thomas Huth wrote:
>>> gcc is not necessarily wrong, as it CAN catch real erroneous uses of 
>>> strncpy().  It's just that 99% of the time, strncpy() is the WRONG 
>>> function to use, and so the remaining few cases where it actually does 
>>> what you want are so rare that you have to consult the manual anyways. 
>>> If nothing else, the gcc warning is making people avoid strncpy() even 
>>> where it is safe (which is not a bad thing, in my opinion, because the 
>>> contract of strncpy() is so counter-intuitive).
>>>
>> I am wondering if we should simply add a helper for these special cases
>> that zeroes the buffer and uses g_strlcpy(), instead of
>> ignoring/disabling the warning.
> Yes, a helper function with a proper comment about its purpose is likely
> the best way to go.

But why use g_strlcpy in the function (which has an off-by-one effect)?

Maybe it could be a qemu_strncpy that is the same as strncpy but returns
-ERANGE if the source is longer than the buffer that is passed in (but
not if it fits perfectly without a terminating NUL):

    int qemu_strncpy(const char *d, const char *s, int dsize)
    {
        while (*s && dsize) {
            *d++ = *s++;
            dsize--;
        }
        /* It's okay if D is just past the end of the buffer,
         * and S is sitting on the terminating NUL.
         */
        if (*s) {
            return -ERANGE;
        }
        while (dsize) {
            *d++ = 0;
        }
        return 0;
    }

Then we have the problem of yet another incomplete transition, but at
least we could convert those that GCC complains about.

Paolo

