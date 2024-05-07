library ieee;
use ieee.std_logic_1164.all;
entity mealy is
    port(    clock, reset: in std_logic;
            data_out: out std_logic;
            data_in: in std_logic_vector (1 downto 0));
end mealy;
architecture behave of mealy is
    type state_values is (st0, st1, st2, st3, st4);
    signal pres_state, next_state: state_values;
begin
-- FSM register
statereg: process (clock, reset)
    begin
        if (reset = '0') then
            pres_state <= st0;
        elsif (clock'event and clock ='1') then
            pres_state <= next_state;
        end if;
end process statereg;

-- FSM combinational block
fsm: process (pres_state, data_in)
    begin
        case pres_state is
            when st0 =>
                case data_in is
                    when "00" => next_state <= st0;
                    when "01" => next_state <= st4;
                    when "10" => next_state <= st1;
                    when "11" => next_state <= st2;
                    when others => next_state <= st0;
                end case;
            when st1 =>
                case data_in is
                    when "00" => next_state <= st0;
                    when "10" => next_state <= st2;
                    when others => next_state <= st1;
                end case;
            when st2 =>
                case data_in is
                    when "00" => next_state <= st1;
                    when "01" => next_state <= st1;
                    when "10" => next_state <= st3;
                    when "11" => next_state <= st3;
                    when others => next_state <= st2;
                end case;
            when st3 =>
                case data_in is
                    when "01" => next_state <= st4;
                    when "11" => next_state <= st4;
                    when others => next_state <= st3;
                end case;
            when st4 =>
                case data_in is
                    when "11" => next_state <= st4;
                    when others => next_state <= st0;
                end case;
            when others => next_state <= st0;
            end case;
end process fsm;

-- Mealy output definition using pres_state w/ data_in
outputs: process (pres_state, data_in)
    begin
        case pres_state is
            when st0 =>
                case data_in is
                    when "00" => data_out <= '0';
                    when others => data_out <= '1';
                end case;
            when st1 => data_out <= '0';
            when st2 =>
                case data_in is
                    when "00" => data_out <= '0';
                    when "01" => data_out <= '0';
                    when others => data_out <= '1';
                end case;
            when st3 => data_out <= '1';
            when st4 =>
                case data_in is
                    when "10" => data_out <= '1';
                    when "11" => data_out <= '1';
                    when others => data_out <= '0';
                end case;
            when others => data_out <= '0';
        end case;
end process outputs;
end behave;
