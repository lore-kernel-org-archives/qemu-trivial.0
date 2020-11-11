Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kcp49-0000Xa-Ip
	for mharc-qemu-trivial@gnu.org; Wed, 11 Nov 2020 07:17:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcp41-0000WP-Cz
 for qemu-trivial@nongnu.org; Wed, 11 Nov 2020 07:17:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcp3t-0000eY-C3
 for qemu-trivial@nongnu.org; Wed, 11 Nov 2020 07:17:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605097034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yL5OomwZjSaM0wsAc5WeuJjg7bKZVzd6xKKyxGMGCX8=;
 b=ExX7Bh+iPxvsuURy1ClS/Yyu6vI+avNzz05DBBtwgT/niOfmRnDhuiqrY0lb9F/cyYTAQg
 fXFl7WWSxew5hZ6QUFTJ4AjDiucZkrbZao3zYqH97gTskD69hBz/w4aTKWmwZMXX5STcJ5
 /RUufIX8wkNGvQTqu0So/bNG5NEjv/o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-mD8y9il8MTSTK2hLMNKDzw-1; Wed, 11 Nov 2020 07:17:12 -0500
X-MC-Unique: mD8y9il8MTSTK2hLMNKDzw-1
Received: by mail-wr1-f70.google.com with SMTP id p16so537933wrx.4
 for <qemu-trivial@nongnu.org>; Wed, 11 Nov 2020 04:17:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3N7aZczImXPu8A5qAEXQ5mIlgVnKXwqgoYmTPEmP4Dg=;
 b=WDi49VkMnuE1HPcT9ELyZl8wcfSoxouSiJyhvfsgd67b3/fRPYHeNmeJAP7h1C6JIT
 DOJrEl60EcE0YU7SHm6vXTjMMQS38kVof7XrOSfCVMaDUuhcnvG67onyC4hBQiWi1jmo
 q85WEi5F/3i+nl5DsLo+9GCUyLkuDZc9oeiSSCNIv7YMQnGWGVUgDKFi0IEyine60q8E
 0e/4TeDOId+QNMUWYY9kY3JohfFD+y5qb9CmU88PlloScpL2+PsGm3oVejGHngXtOJ9E
 l//QqgXj/6gEZzJs2Prk8ofJMx9o/i5wWuPU/lS50q3ltA7HiyHRmBZIIzqKNc3mzuOP
 QQQA==
X-Gm-Message-State: AOAM532dAKW1fTzXo+NibwOTjFOFIm20us9kWfuPVNUZ/YvR/DRpcjGT
 xmsRd65KAtv3SSffh2ESUL1hdOj6I3frPZrY+gwR5xeWFkooJcSU6Ii3j9VRALArqgGrxNS7PBm
 os0BFu46hQOx/7pQdfA==
X-Received: by 2002:a1c:7303:: with SMTP id d3mr4067673wmb.152.1605097030952; 
 Wed, 11 Nov 2020 04:17:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPH095VkUW0FAL9lShB/Z0dihy2zU1MVdM5vSznff0VyJBWG5K3Fr2ECkAebZQBo0oyghyow==
X-Received: by 2002:a1c:7303:: with SMTP id d3mr4067649wmb.152.1605097030773; 
 Wed, 11 Nov 2020 04:17:10 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id c17sm2296567wro.19.2020.11.11.04.17.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 04:17:10 -0800 (PST)
Subject: Re: [PATCH] dev-uas: Fix a error of variable sized type not at end
To: Han Han <hhan@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, laurent@vivier.eu,
 Daniele Buono <dbuono@linux.vnet.ibm.com>
References: <20201111064737.576673-1-hhan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ccdf2399-f5ab-ac05-92ec-f5acd318e0f2@redhat.com>
Date: Wed, 11 Nov 2020 13:17:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201111064737.576673-1-hhan@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Nov 2020 12:17:30 -0000

SGkgSGFuLA0KDQpPbiAxMS8xMS8yMCA3OjQ3IEFNLCBIYW4gSGFuIHdyb3RlOg0KPiBGaXggdGhl
IGZvbGxvd2luZyBlcnJvciB3aGVuIGNvbXBpbGluZzoNCj4gDQo+IEZBSUxFRDogbGliY29tbW9u
LmZhLnAvaHdfdXNiX2Rldi11YXMuYy5vDQo+IGNsYW5nIC1JbGliY29tbW9uLmZhLnAgLUkuIC1J
Li4gLUlxYXBpIC1JdHJhY2UgLUl1aSAtSXVpL3NoYWRlciAtSS91c3IvaW5jbHVkZS9saWJ1c2It
MS4wIC1JL3Vzci9pbmNsdWRlL3NwaWNlLTEgLUkvdXNyL2luY2x1ZGUvc3BpY2Utc2VydmVyIC1J
L3Vzci9pbmNsdWRlL2NhY2FyZCAtSS91c3IvaW5jbHVkZS9nbGliLTIuMCAtSS91c3IvbGliNjQv
Z2xpYi0yLjAvaW5jbHVkZSAtSS91c3IvaW5jbHVkZS9uc3MzIC1JL3Vzci9pbmNsdWRlL25zcHI0
IC1JL3Vzci9pbmNsdWRlL2xpYm1vdW50IC1JL3Vzci9pbmNsdWRlL2Jsa2lkIC1JL3Vzci9pbmNs
dWRlL3BpeG1hbi0xIC1JL3Vzci9pbmNsdWRlL3Z0ZS0yLjkxIC1JL3Vzci9pbmNsdWRlL3Bhbmdv
LTEuMCAtSS91c3IvaW5jbHVkZS9oYXJmYnV6eiAtSS91c3IvaW5jbHVkZS9mcmVldHlwZTIgLUkv
dXNyL2luY2x1ZGUvbGlicG5nMTYgLUkvdXNyL2luY2x1ZGUvZnJpYmlkaSAtSS91c3IvaW5jbHVk
ZS9saWJ4bWwyIC1JL3Vzci9pbmNsdWRlL2NhaXJvIC1JL3Vzci9pbmNsdWRlL2d0ay0zLjAgLUkv
dXNyL2luY2x1ZGUvZ2RrLXBpeGJ1Zi0yLjAgLUkvdXNyL2luY2x1ZGUvZ2lvLXVuaXgtMi4wIC1J
L3Vzci9pbmNsdWRlL2F0ay0xLjAgLUkvdXNyL2luY2x1ZGUvYXQtc3BpMi1hdGsvMi4wIC1JL3Vz
ci9pbmNsdWRlL2RidXMtMS4wIC1JL3Vzci9saWI2NC9kYnVzLTEuMC9pbmNsdWRlIC1JL3Vzci9p
bmNsdWRlL2F0LXNwaS0yLjAgLUkvdXNyL2luY2x1ZGUvU0RMMiAtSS91c3IvaW5jbHVkZS9zbGly
cCAtSS91c3IvaW5jbHVkZS92aXJnbCAtSS91c3IvaW5jbHVkZS9jYXBzdG9uZSAtWGNsYW5nIC1m
Y29sb3ItZGlhZ25vc3RpY3MgLXBpcGUgLVdhbGwgLVdpbnZhbGlkLXBjaCAtV2Vycm9yIC1zdGQ9
Z251OTkgLU8yIC1nIC1mc2FuaXRpemU9dW5kZWZpbmVkIC1mc2FuaXRpemU9YWRkcmVzcyAtbTY0
IC1tY3gxNiAtRF9HTlVfU09VUkNFIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgLURfTEFSR0VGSUxF
X1NPVVJDRSAtV3N0cmljdC1wcm90b3R5cGVzIC1XcmVkdW5kYW50LWRlY2xzIC1XdW5kZWYgLVd3
cml0ZS1zdHJpbmdzIC1XbWlzc2luZy1wcm90b3R5cGVzIC1mbm8tc3RyaWN0LWFsaWFzaW5nIC1m
bm8tY29tbW9uIC1md3JhcHYgLVdvbGQtc3R5bGUtZGVmaW5pdGlvbiAtV3R5cGUtbGltaXRzIC1X
Zm9ybWF0LXNlY3VyaXR5IC1XZm9ybWF0LXkyayAtV2luaXQtc2VsZiAtV2lnbm9yZWQtcXVhbGlm
aWVycyAtV2VtcHR5LWJvZHkgLVduZXN0ZWQtZXh0ZXJucyAtV2VuZGlmLWxhYmVscyAtV2V4cGFu
c2lvbi10by1kZWZpbmVkIC1Xbm8taW5pdGlhbGl6ZXItb3ZlcnJpZGVzIC1Xbm8tbWlzc2luZy1p
bmNsdWRlLWRpcnMgLVduby1zaGlmdC1uZWdhdGl2ZS12YWx1ZSAtV25vLXN0cmluZy1wbHVzLWlu
dCAtV25vLXR5cGVkZWYtcmVkZWZpbml0aW9uIC1Xbm8tdGF1dG9sb2dpY2FsLXR5cGUtbGltaXQt
Y29tcGFyZSAtV25vLXBzYWJpIC1mc3RhY2stcHJvdGVjdG9yLXN0cm9uZyAtZnNhbml0aXplPWZ1
enplci1uby1saW5rIC1pc3lzdGVtIC9ob21lL2hoYW4vU29mdHdhcmUvcWVtdS9saW51eC1oZWFk
ZXJzIC1pc3lzdGVtIGxpbnV4LWhlYWRlcnMgLWlxdW90ZSAvaG9tZS9oaGFuL1NvZnR3YXJlL3Fl
bXUvdGNnL2kzODYgLWlxdW90ZSAuIC1pcXVvdGUgL2hvbWUvaGhhbi9Tb2Z0d2FyZS9xZW11IC1p
cXVvdGUgL2hvbWUvaGhhbi9Tb2Z0d2FyZS9xZW11L2FjY2VsL3RjZyAtaXF1b3RlIC9ob21lL2ho
YW4vU29mdHdhcmUvcWVtdS9pbmNsdWRlIC1pcXVvdGUgL2hvbWUvaGhhbi9Tb2Z0d2FyZS9xZW11
L2Rpc2FzL2xpYnZpeGwgLXB0aHJlYWQgLWZQSUMgLURTVFJVQ1RfSU9WRUNfREVGSU5FRCAtRF9S
RUVOVFJBTlQgLVduby11bmRlZiAtRF9ERUZBVUxUX1NPVVJDRSAtRF9YT1BFTl9TT1VSQ0U9NjAw
IC1ETkNVUlNFU19XSURFQ0hBUiAtTUQgLU1RIGxpYmNvbW1vbi5mYS5wL2h3X3VzYl9kZXYtdWFz
LmMubyAtTUYgbGliY29tbW9uLmZhLnAvaHdfdXNiX2Rldi11YXMuYy5vLmQgLW8gbGliY29tbW9u
LmZhLnAvaHdfdXNiX2Rldi11YXMuYy5vIC1jIC4uL2h3L3VzYi9kZXYtdWFzLmMNCj4gLi4vaHcv
dXNiL2Rldi11YXMuYzoxNTg6MzE6IGVycm9yOiBmaWVsZCAnc3RhdHVzJyB3aXRoIHZhcmlhYmxl
IHNpemVkIHR5cGUgJ3Vhc19pdScgbm90IGF0IHRoZSBlbmQgb2YgYSBzdHJ1Y3Qgb3IgY2xhc3Mg
aXMgYSBHTlUgZXh0ZW5zaW9uIFstV2Vycm9yLC1XZ251LXZhcmlhYmxlLXNpemVkLXR5cGUtbm90
LWF0LWVuZF0NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhhbiBIYW4gPGhoYW5AcmVkaGF0LmNvbT4N
Cj4gLS0tDQo+ICBody91c2IvZGV2LXVhcy5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaHcvdXNiL2Rl
di11YXMuYyBiL2h3L3VzYi9kZXYtdWFzLmMNCj4gaW5kZXggY2VjMDcxZDk2Yy4uNWVmM2Y0ZmVj
OSAxMDA2NDQNCj4gLS0tIGEvaHcvdXNiL2Rldi11YXMuYw0KPiArKysgYi9ody91c2IvZGV2LXVh
cy5jDQo+IEBAIC0xNTQsOSArMTU0LDkgQEAgc3RydWN0IFVBU1JlcXVlc3Qgew0KPiAgDQo+ICBz
dHJ1Y3QgVUFTU3RhdHVzIHsNCj4gICAgICB1aW50MzJfdCAgICAgICAgICAgICAgICAgIHN0cmVh
bTsNCj4gLSAgICB1YXNfaXUgICAgICAgICAgICAgICAgICAgIHN0YXR1czsNCj4gICAgICB1aW50
MzJfdCAgICAgICAgICAgICAgICAgIGxlbmd0aDsNCj4gICAgICBRVEFJTFFfRU5UUlkoVUFTU3Rh
dHVzKSAgIG5leHQ7DQo+ICsgICAgdWFzX2l1ICAgICAgICAgICAgICAgICAgICBzdGF0dXM7DQo+
ICB9Ow0KPiAgDQo+ICAvKiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gKi8NCj4gDQoNCkRhbmllbGUgYWxyZWFkeSBz
ZW50IGEgcGF0Y2ggZm9yIHRoaXMgaXNzdWU6DQpodHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29t
L3FlbXUtZGV2ZWxAbm9uZ251Lm9yZy9tc2c3NTc5NDAuaHRtbA0K


