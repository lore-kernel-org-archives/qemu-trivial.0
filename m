Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tdQrn-0006PY-3B
	for mharc-qemu-trivial@gnu.org; Thu, 30 Jan 2025 04:29:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1tdQrl-0006Oi-OB
 for qemu-trivial@nongnu.org; Thu, 30 Jan 2025 04:29:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1tdQri-00012L-P5
 for qemu-trivial@nongnu.org; Thu, 30 Jan 2025 04:29:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738229376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=FTZ0NNL4KbUZBcmZeeafUqWWmSADVE4sxskeASIgPyc=;
 b=WrZCsS6X5N8jQz97rjqnGjWM1gwi6KPq1b1HMzn4AJGdOsvOYzn2Uj+uolXfD+RrMkSe5g
 TabyDrz31IgJ3goune75ejPoqlTMODXTx0IgrtABh071U0aZsVtVmyGwON80arPK3TIxgp
 T1RDxN7mqeNYJtN11HeAsR8GQ0TFs08=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-PE0a2YMZPkCnml9FDN_yhA-1; Thu, 30 Jan 2025 04:29:34 -0500
X-MC-Unique: PE0a2YMZPkCnml9FDN_yhA-1
X-Mimecast-MFC-AGG-ID: PE0a2YMZPkCnml9FDN_yhA
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38c5dcb33a5so163810f8f.2
 for <qemu-trivial@nongnu.org>; Thu, 30 Jan 2025 01:29:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738229374; x=1738834174;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FTZ0NNL4KbUZBcmZeeafUqWWmSADVE4sxskeASIgPyc=;
 b=tnBRBLLyVOfpRDiZUAWYgP690bi41Td3ASiLft4N86KKFKipBhkl6bHchFRnCgBzq1
 BUuYH58vYQHNBYVTH6LFacXe/zicW+bf5o45uXeDACNZxaYzb2oTRWhM0nhHWuaelBLQ
 4OH4sTMG3xuKX0E3gzFwbQuWbEJ4giUcfuRf//BqI0IjtCQEcyf0JBvDJi3ozU8aA1FL
 x0qDYCFQI7UWt19w1E/fk4dSLtMX8bTNLp+befiS5cNEvFP4jNonzgmrEsA4sBwFPFaQ
 GMVk3MG2awepbu/fUlZxbC/9/t1GA7GJafK66ZZ7l4T4kpcr17Hs3fD8r5IWDra202mT
 L08g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLcbanQ6trwd2B/oeHt3UcbIfC/nIvApor0KQzqqD3U/qwO2pAAj52WZDbpcBrphexP1CXTUhnCb3sVQc=@nongnu.org
X-Gm-Message-State: AOJu0Ywl3S/R9B9BZTufkxiVc/Jm7dlfnrJ1DlPWqhLV3AGtp+n5iDhF
 yzwWAr7mChZ9h3zKW5+SF7vM6FKjVIYCOOV5RZOgupL3fzMLEuh5IEjOrlo8PPtVCb0Qxr03GIg
 5eSpo4WFrUcJMAjZN3+cWYsh+1LtzXnGar2m0RQMp7FkzLApXrM5GGk4=
X-Gm-Gg: ASbGncvelKvfnfPDxt75DyJReijmUQ/tPpcrKxkZU+s/PTtN/2H3p/7e1uo7/O5FJeP
 0GyD2pCzqXrLtTrMEPYlgYnqDFtU9zFB2oQOsecFj0B3ptQoATpyeE41B27nFhsg3u4/sVvlTNe
 zfdi8dNIEUPSptbAQWbp6ASVV25nTOOgn3TTOFWoipZe4RovIMJjQw8wRRpbLfYQy6BZeHmTsZC
 bliOXcKQOWqoRTu1AnqMSu7pvILnxzsEkCk2i1l3/sb6qCTLKegH9FELy/Hw13KICYnFZ9f2VsD
 V/e4pl0lwJ3IjcRzI965uW1CVjEgZKXNx7lf1M0Cv2Q=
X-Received: by 2002:a5d:6487:0:b0:38b:669d:4dd4 with SMTP id
 ffacd0b85a97d-38c5192f1f4mr5166959f8f.11.1738229373693; 
 Thu, 30 Jan 2025 01:29:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMxR9PgftdD47rhI9MraZxXAXEV5YIUWLzbB7qIk8tJaroQrHgLBaN1W8Mx+eWinyN2ca7vw==
X-Received: by 2002:a5d:6487:0:b0:38b:669d:4dd4 with SMTP id
 ffacd0b85a97d-38c5192f1f4mr5166937f8f.11.1738229373349; 
 Thu, 30 Jan 2025 01:29:33 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e10:ef90:343a:68f:2e91:95c?
 ([2a01:e0a:e10:ef90:343a:68f:2e91:95c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c0ec35asm1441462f8f.15.2025.01.30.01.29.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 01:29:32 -0800 (PST)
Message-ID: <06f5b8c8-1d06-43aa-80ae-d7ef384d34a6@redhat.com>
Date: Thu, 30 Jan 2025 10:29:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] net: Fix announce_self with vhost
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>, 
 qemu-stable <qemu-stable@nongnu.org>
References: <20250117111709.970789-1-lvivier@redhat.com>
 <f508fd5f-23c6-4f0c-8fdc-bfedd5a9e9e0@tls.msk.ru>
From: Laurent Vivier <lvivier@redhat.com>
Autocrypt: addr=lvivier@redhat.com; keydata=
 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
In-Reply-To: <f508fd5f-23c6-4f0c-8fdc-bfedd5a9e9e0@tls.msk.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: c3CMWGVuNWW-1UL8r4cI5KVDn7whphsOb0T8afv5v1I_1738229374
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jan 2025 09:29:42 -0000

On 18/01/2025 21:20, Michael Tokarev wrote:
> 17.01.2025 14:17, Laurent Vivier wrote:
>> announce_self that sends a RARP packet after migration
>> or with announce_self QMP/HMP command doesn't work with
>> vhost because of the vnet headers.
>>
>> announce_self is the only user of QEMU_NET_PACKET_FLAG_RAW and
>> this flag is not correctly managed.
>>
>> This series fix a problem with this flag in filter-dump and in
>> qemu_deliver_packet_iov().
>>
>> Laurent Vivier (2):
>>    net: Fix announce_self
>>    net/dump: Correctly compute Ethernet packet offset
>>
>>   net/dump.c | 3 ++-
>>   net/net.c  | 1 +
>>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
> 
> Applied to trivial-patches and queued for qemu-stable.
> 

When do you plan to send the PR for them?

Thanks,
Laurent


