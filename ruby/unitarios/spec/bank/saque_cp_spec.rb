require_relative "../../app/bank" #importando o arquivo

# rspec --format html --out report.html (para gerar um relatório do resultado em HTML) ou
# rspec --format RspecJunitFormatter --out report.xml (instalar a gem rspec_junit_formatter)
# se adicionar o -fd ao final do comando, também executa no terminal

describe ContaPoupanca do
  describe "Saque" do
    context "quando o valor é positivo" do
      before(:all) do
        @cp = ContaPoupanca.new(1000.0)
        @cp.saca(200.00)
      end
      it "entao atualiza saldo" do
        expect(@cp.saldo).to eql 798.00
      end
    end

    context "quando o saldo é insuficiente" do
      before(:all) do
        @cp = ContaPoupanca.new(0.00)
        @cp.saca(100.00)
      end
      it "então exibe mensagem" do
        expect(@cp.mensagem).to eql "Saldo insuficiente para saque :("
      end
      it "e o saldo final com zeros" do
        expect(@cp.saldo).to eql 0.00
      end
    end

    context "quando saldo é suficiente" do
      before(:all) do
        @cp = ContaPoupanca.new(500.00)
        @cp.saca(501.00)
      end
      it "então exibe mensagem" do
        expect(@cp.mensagem).to eql "Saldo insuficiente para saque :("
      end
      it "e o saldo permanece" do
        expect(@cp.saldo).to eql 500.0
      end
    end

    context "quando supera o limite de saque" do
      before(:all) do
        @cp = ContaPoupanca.new(1000.00)
        @cp.saca(701.00)
      end
      it "então exibe mensagem" do
        expect(@cp.mensagem).to eql "Limite máximo por saque é de R$ 500"
      end
      it "e o saldo permanece" do
        expect(@cp.saldo).to eql 1000.00
      end
    end
  end
end
