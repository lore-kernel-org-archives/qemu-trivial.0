Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kPhc0-0003HE-Te
	for mharc-qemu-trivial@gnu.org; Tue, 06 Oct 2020 03:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kPhby-0003BX-Rt
 for qemu-trivial@nongnu.org; Tue, 06 Oct 2020 03:42:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kPhbw-0002xE-BI
 for qemu-trivial@nongnu.org; Tue, 06 Oct 2020 03:42:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601970130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BgId7LstDm7tdDrDOesKhRCBO+RL7ifS3kYl+H00O8g=;
 b=BxT9IZMuxUn9rPijZ92G11F+T8RZhdVObBYI2NKVqIF/Tvo3Vmm0NN7wdr290tocrlHW/Q
 ACXEx0yuwpAC2VM48bVItHbRb272xWViWh380nKR9AIEjpo1EEKwD6wLf4GmoRp/4E4sW8
 kUQZyEDsOPmiFtS/tfmIFYkw/41LD0k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-zlxt7D-cNXGEmbjcn1W2wA-1; Tue, 06 Oct 2020 03:42:07 -0400
X-MC-Unique: zlxt7D-cNXGEmbjcn1W2wA-1
Received: by mail-wr1-f72.google.com with SMTP id b6so275711wrn.17
 for <qemu-trivial@nongnu.org>; Tue, 06 Oct 2020 00:42:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BgId7LstDm7tdDrDOesKhRCBO+RL7ifS3kYl+H00O8g=;
 b=W3hE3/d9snv/hYcbX/G5W6JIxPc7YVaLkWImNOQfhVWWz0NYKAf4XbDz1UyrqCHkCP
 U0Od1ln7meYm9l/W7T5yFjji9tTe8CTVRNbZfm++E7ophdK72DtKqO4HoJguwuRNExaF
 PaFc2bw4axSbQ6tKjsqxUXANmTvdcmbfotjsXZ1+pGcPrLTBQya4YkeFKUhU1gk4W1gf
 /av40blqsCQAHwmdA9lpok6tsFilsblB0w70wh/oC5G99O05nV1nTdbwJBv+uHkI+naf
 IhhR1ljZkvqh6mDvDTxmaeojkx5ytocXfP+uE8hYzzEosWMPf/3cL8IlIVn17IyIKU1K
 S3EQ==
X-Gm-Message-State: AOAM531Ac+odBimpirizXeS2NfoXFrJzojySpHp0V6DZBIDDnWiSfU3E
 0aj86b8DlC7pcO7G7bS62qYy9aiAxIJFdeucw3injfk0EjSA63RYFD5TH+oTV9meTeld4xBKHkn
 Uz5wNstJhoXtoe01Cmw==
X-Received: by 2002:a1c:a593:: with SMTP id o141mr3352648wme.88.1601970126747; 
 Tue, 06 Oct 2020 00:42:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHM1zfXwthC7OTHyqntKgn8EiG/SZjcN514t2ZqVLFf3YTtTgs4CjaCN71VEkIEw/Dt/9e+w==
X-Received: by 2002:a1c:a593:: with SMTP id o141mr3352616wme.88.1601970126489; 
 Tue, 06 Oct 2020 00:42:06 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5aca:cd0b:c4a1:9c2e?
 ([2001:b07:6468:f312:5aca:cd0b:c4a1:9c2e])
 by smtp.gmail.com with ESMTPSA id h76sm2818079wme.10.2020.10.06.00.42.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2020 00:42:05 -0700 (PDT)
Subject: Re: [PATCH v2] scripts: Convert qemu-version.sh to qemu-version.py
To: Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20201005172109.416-1-luoyonggang@gmail.com>
 <CAFEAcA95r2FZibphrO0N_rckWOKigM_d80Qi0grtpWWzN3d19A@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7f6f412b-03f8-b8f3-9708-0080277999a6@redhat.com>
Date: Tue, 6 Oct 2020 09:42:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA95r2FZibphrO0N_rckWOKigM_d80Qi0grtpWWzN3d19A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 00:55:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Tue, 06 Oct 2020 07:42:15 -0000

On 05/10/20 21:22, Peter Maydell wrote:
>> +def main(args):
>> +    if len(args) <= 3:
>> +        sys.exit(0)
>> +
>> +    dir = args[1]
>> +    pkgversion = args[2]
>> +    version = args[3]

In addition to what Peter pointed out, all these lines can be changed to

    def main(dir, pkgversion, version, *unused):

and below

    if __name__ == "__main__":
        main(*sys.argv)

>> +    pc = subprocess.run(['git', 'describe', '--match', "'v*'", '--dirty', '--always'],
>> +        stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, cwd=dir)
>> +    if pc.returncode == 0:
>> +        pkgversion = pc.stdout.decode('utf8').strip()
>> +    fullversion = version
>> +    if len(pkgversion) > 0:

Just "if pkgversion:" please.

>> +        fullversion = "{} ({})".format(version, pkgversion)
>> +
>> +    version_header = '''#define QEMU_PKGVERSION "{}"
>> +#define QEMU_FULL_VERSION "{}"'''.format(pkgversion, fullversion)
>> +    sys.stdout.buffer.write(version_header.encode('utf8'))

No need to use buffer and encode, just

    print('#define QEMU_PKGVERSION "%s"' % pkgversion)
    print('#define QEMU_FULLVERSION "%s"' % fullversion)

It is still a bit more clunky than a shell script, but at least not as much.

Paolo


