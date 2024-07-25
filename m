Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sWsHg-0002AQ-5y
	for mharc-qemu-trivial@gnu.org; Thu, 25 Jul 2024 02:49:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1sWsHe-00029M-HX
 for qemu-trivial@nongnu.org; Thu, 25 Jul 2024 02:49:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1sWsHc-0006pB-JP
 for qemu-trivial@nongnu.org; Thu, 25 Jul 2024 02:49:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721890139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=k2wGgR81IQDLYvnUbF/jrg5eMSA3bN9rDhcIoUf5k70=;
 b=i/lklJ0zcgVnJvN/rVa/aXmw2rBDf8QExesRQ+nto4X3y9xlRsM3wHOWYelZnh0GXmwD5r
 MucWYvoz3872CEEEkINnd85fQP3VT3lATvu8VRi+ZsePpO5DjVkHXwe6R9rNmD3M7m88e0
 sMdImPsDFphda8pTW49SJLIsxluX9oI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-c-47MPkEMJq39b4bxyk2yw-1; Thu, 25 Jul 2024 02:48:57 -0400
X-MC-Unique: c-47MPkEMJq39b4bxyk2yw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-426624f4ce3so4056405e9.1
 for <qemu-trivial@nongnu.org>; Wed, 24 Jul 2024 23:48:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721890136; x=1722494936;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k2wGgR81IQDLYvnUbF/jrg5eMSA3bN9rDhcIoUf5k70=;
 b=TFmHhmzAzy3juoUkN5sD3eE0koOpwwvigtws4u++SlXjY4E4K6YlU7MPp3VbIGodx1
 YJqG2+iAovYQ0OfGqs61gHJENPzf1uvSOxGTkm32qKKhVuSpgHT7xVDfsTCfgfT7s6aV
 XDFQjzI1zdZOXojtgF2NP0gT4n/X8g77sbO+GCsh0wYnj7gBG9IY1cGfBhVPenDjPIMs
 8jwF2TrnoYYCqivCALGHmdzUhTMlEzUXc3J3LGTE9qc0vLSFtJXavMFZe+Zth0lTJcuO
 C9bPc80bUmVim/wzx2bLy84j7DAmQQx1B3W7PNuDKDJ+69mJet/EYjACxN05ueBwBd0/
 Zw2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9a0a25miaumq2H9U3JbhgEFAkwFuNG1KluhSlOaODnGUO3m7WprbUkf+/ISngPSLKyXeln/Up2r6oWGRbsTmk2/87P8Jl6w==
X-Gm-Message-State: AOJu0Yw+LRXMt+o3Tl4adV5Ye8h9QVoZJHI3ZLXd+o/s3V/DXR/HAZ6e
 Rd2TKsFmSmjRPWBd/Bh3Oqc9Hdd8Hw/skd8iYxGhVqBYWL79nqOMV57Pc2i6fRWDCNlNsdDZdpJ
 XSXISgxg4YOGolYD5xOCbxoRZPxfLJTD8bLDZ5YuMvs9c5J1NPe9LZ+w=
X-Received: by 2002:a05:600c:b8d:b0:427:ff3b:7a20 with SMTP id
 5b1f17b1804b1-42806bdb344mr7843075e9.27.1721890136415; 
 Wed, 24 Jul 2024 23:48:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAcUzj6udeaD4KgRV0ZG1LZGwz+QN9+d6OUoJtvLhyTVrsnzvFFyB8Qa/NDIpUJ97yLSIexw==
X-Received: by 2002:a05:600c:b8d:b0:427:ff3b:7a20 with SMTP id
 5b1f17b1804b1-42806bdb344mr7842945e9.27.1721890136021; 
 Wed, 24 Jul 2024 23:48:56 -0700 (PDT)
Received: from [192.168.100.100] ([37.170.239.86])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-428054b9196sm19075175e9.0.2024.07.24.23.48.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 23:48:55 -0700 (PDT)
Message-ID: <58363488-4058-4470-8bda-5068381712bb@redhat.com>
Date: Thu, 25 Jul 2024 08:48:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] net: update netdev stream/dgram man page
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>,
 Jason Wang <jasowang@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20240704124834.81958-1-lvivier@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Autocrypt: addr=lvivier@redhat.com; keydata=
 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
In-Reply-To: <20240704124834.81958-1-lvivier@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.136,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 25 Jul 2024 06:49:02 -0000

On 04/07/2024 14:48, Laurent Vivier wrote:
> Add the description of "-netdev stream" and "-netdev dgram" in the QEMU
> manpage.
> 
> Add some examples on how to use them, including a way to use
> "-netdev stream" and "passt" in place of "-netdev user".
> ("passt" is a non privileged translation proxy between layer-2,
> like "-netdev stream", and layer-4 on host, like TCP, UDP,
> ICMP/ICMPv6 echo)
> 
> v2:
>    - split patch
>    - update unix socket description with stream and datagram words.
> 
> Laurent Vivier (4):
>    net: update netdev stream/dgram man page
>    net: update netdev stream man page with unix socket
>    net: update netdev dgram man page with unix socket
>    net: update netdev stream man page with the reconnect parameter
> 
>   qemu-options.hx | 189 ++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 189 insertions(+)
> 
ping

cc: qemu-trivial


